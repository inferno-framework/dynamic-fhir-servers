# frozen_string_literal: true

require 'net/http'
class SearchController < ApplicationController
  include Parser
  def search
    resources = parse

    validTypes = []
    validParams = {}
    definitionLookups = {}
    validCombinations = {}

    # valid resources do not contain "not" in their value code and for this instance are search-type
    resources.each do |i|
      i['interaction']&.each do |j|
        if !j['extension'][0]['valueCode'].downcase.include?('not') && j['code'].downcase == 'search-type'
          validTypes.push(i['type'])
          break
        end
      end
      # create dictionary hash of valid params and their associated type
      i['searchParam']&.each do |k|
        if k['name']
          if !validParams[i['type']]
            validParams[i['type']] = [k['name']]
            definitionLookups[i['type']] = { k['name'] => k['definition'] }
          else
            validParams[i['type']] = validParams[i['type']].push(k['name'])
            definitionLookups[i['type']][k['name']] = k['definition']
          end
        end
      end

      # create dictionary hash of arrays of valid parameter combinations for each resource
      next unless i['extension']

      i['extension'].each do |subExtension|
        tempCombo = []
        next unless subExtension['url'].include?('search-parameter-combination')

        subExtension['extension'].each do |k|
          tempCombo.push(k['valueString']) if k['valueString']
        end
        
        if !validCombinations[i['type']]
          validCombinations[i['type']] = []
          validCombinations[i['type']] = validCombinations[i['type']].push(tempCombo)
        else
          validCombinations[i['type']] = validCombinations[i['type']].push(tempCombo)
        end
      end
    end

    # now with valid resources
    type = params[:type]
    if validTypes.include?(type)
      queryParams = request.query_parameters
      validTypeParams = validParams[type]

      # validate all query params are valid search params associated with the resource
      queryParams&.each do |i, _j|
        unless validTypeParams.include?(i)
          render json: "Unknown search parameter: #{i}. Value search parameters for this search are : #{validTypeParams}", status: 400
          return
        end
      end

      # validate the combination of query params are valid combinations when the size is > 1
      if queryParams.size > 1
        paramKeys = []
        queryParams.each do |i, _j|
          paramKeys.push(i)
        end

        invalidCombination = true

        validCombinations[type].each do |combo|
          if combo.sort == paramKeys.sort
            invalidCombination = false
            break
          end
        end

        if invalidCombination
          render json: "Unknown search parameter combination: #{paramKeys}. Value search parameter combinations for this search are : #{validCombinations[type]}", status: 400
          return
        end

      end

      # pull the actual data and see what records match
      @connection = ActiveRecord::Base.connection
      searchResults = []
      results = @connection.exec_query("SELECT resource FROM allresourcetype where lower(resource_type) = '#{type.downcase}'")

      results.each do |result|
        queryMatch = true
        jsonResult = JSON.parse(result['resource'])
        queryExpression = ''

        next unless jsonResult

        # puts jsonResult
        queryParams.each do |i, j|

          Dir["**/app/jsonfiles/SearchParameter*#{definitionLookups[type][i].split('/')[-1]}.json"].each do |file|
            queryExpression = (JSON.parse(File.read(file)))['expression']
            break
          end

          # parse out functions for now since validator doesn't work with those here yet
          if queryExpression.include?('()')
            querySpliced = queryExpression.split('.')
            queryExpression = "#{querySpliced[0]}.#{querySpliced[1]}"
          end

          # external integration to get result of FHIR expression
          uri = URI("http://localhost:4567/evaluate?path=#{queryExpression}")
          req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
          req.body = jsonResult.to_json
          res = Net::HTTP.start(uri.hostname, uri.port) do |http|
            httpResponse = http.request(req)
            puts("response: #{httpResponse.body}")
            unless httpResponse.body.include?(j)
              puts("not found: #{j}")
              queryMatch = false
            end
          end
        end

        searchResults.push(result['resource']) if queryMatch
      end

      # if empty just return empty array to mirror R4 FHIR functionality
      json_response(searchResults)

    else
      render json: "Unknown Resource type: #{type}, valid resource types are : #{validTypes}", status: 404
      nil
    end
  end
end
