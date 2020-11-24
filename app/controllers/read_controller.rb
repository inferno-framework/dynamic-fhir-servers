# frozen_string_literal: true
require 'json'
class ReadController < ApplicationController
  include Parser
  def getById
    resources = parse

    validTypes = []

    # valid resources do not contain "not" in their value code and for this instance are read
    resources.each do |i|
      next unless i['interaction']

      i['interaction'].each do |j|
        if !j['extension'][0]['valueCode'].downcase.include?('not') && j['code'].downcase == 'read'
          validTypes.push(i['type'])
          break
        end
      end
    end

    type = params[:type]
    id = params[:id]

    # if the capability statement isn't there we still want to query and see what we find
    if validTypes.include?(type) || !Dir.glob("**/app/jsonfiles/#{Rails.configuration.capabilityStatementName}").first
      @connection = ActiveRecord::Base.connection
      result = @connection.exec_query("SELECT resource FROM allresourcetype WHERE id = '#{id}' and lower(resource_type) = '#{type.downcase}'")
      #puts result[0]["resource"].as_json
      if !result.empty?
      # first result for get by id
        result = result[0]["resource"].as_json
        result = JSON.parse(result)
        json_response(JSON.pretty_generate(result))
      else
        issue = Array.new
        issue.push({'severity' => 'error', 'code' => 'processing', 'diagnostics' => "Id: #{id} for Resource: #{type} is not found"})
        render json: {'resourceType' => "OperationOutcome", 'issue' => issue}, status: 404
      end
      #lastUpdated = {'lastUpdated' => Time.now}
      #links = Array.new
      #links.push({'relation' => "self", 'url' => request.original_url})
      #jsonResult = {"resourceType" =>'Bundle', 'id' => Random.uuid(), 'meta' => lastUpdated, 'type' => "searchset", 'total' => '1', 'link' => links, 'entry' => result}
      
    else
      render json: "Unknown Resource type: #{type}, valid resource types are : #{validTypes}", status: 404
    end
  end
end
