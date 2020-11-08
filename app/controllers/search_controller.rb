class SearchController < ApplicationController
    include Parser
    def search
        resources = parse()

        validTypes = Array.new
        validParams = {}
        validCombinations = {}

        # valid resources do not contain "not" in their value code and for this instance are search-type
        resources.each do |i|
            if i["interaction"]
                i["interaction"].each do |j|
                    if !j["extension"][0]["valueCode"].downcase.include?("not") && j["code"].downcase == "search-type"
                        validTypes.push(i["type"])
                        break
                    end
                end
            end
            # create dictionary hash of valid params and their associated type
            if i["searchParam"]
                i["searchParam"].each do |k|
                    if k["name"]
                        if !validParams[i["type"]]
                            validParams[i["type"]] = [k["name"]]
                        else
                            validParams[i["type"]] = validParams[i["type"]].push(k["name"])
                        end
                    end
                end
            end

            # create dictionary hash of arrays of valid parameter combinations for each resource
            if i["extension"]
                i["extension"].each do |subExtension|
                    tempCombo = Array.new
                    if subExtension["url"].include?("search-parameter-combination")
                        subExtension["extension"].each do |k|
                            if k["valueString"]
                                tempCombo.push(k["valueString"])
                            end
                        end
                        #puts (tempCombo)
                        if !validCombinations[i["type"]]
                            validCombinations[i["type"]] = Array.new
                            validCombinations[i["type"]] = validCombinations[i["type"]].push(tempCombo)
                        else
                            validCombinations[i["type"]] = validCombinations[i["type"]].push(tempCombo)
                        end
                    end
                end
            end
        end

        #puts validCombinations["CarePlan"]

        # now with valid resources
        type = params[:type]
        if validTypes.include?(type)
            queryParams = request.query_parameters
            validTypeParams = validParams[type]

            # validate all query params are valid search params associated with the resource
            if queryParams
                queryParams.each do |i, j|
                    if !validTypeParams.include?(i)
                        render :json => "Unknown search parameter: #{i}. Value search parameters for this search are : #{validTypeParams}", :status => 400
                        return
                    end
                end
            end

            # validate the combination of query params are valid combinations when the size is > 1
            if queryParams.size() > 1
                paramKeys = Array.new
                queryParams.each do |i, j|
                    paramKeys.push(i)
                end

                if !validCombinations[type].include?(paramKeys)
                    render :json => "Unknown search parameter combination: #{paramKeys}. Value search parameter combinations for this search are : #{validCombinations[type]}", :status => 400
                    return
                end

            end

            # pull the actual data and see what records match
            @connection = ActiveRecord::Base.connection
            searchResults = Array.new
            results = @connection.exec_query("SELECT resource FROM #{type}")

            results.each do |result|
                queryMatch = true
                jsonResult = JSON.parse(result["resource"])
                if jsonResult
                    puts jsonResult
                    queryParams.each do |i,j|
                        #if !JSON.generate(jsonResult[i]).include?(j)
                        if !JSON.generate(jsonResult).include?(j)
                            #puts jsonResult[i]
                            puts ("not found: #{j}")
                            queryMatch = false
                        end
                    end

                    if queryMatch
                        searchResults.push(result["resource"])
                    end
                end
            end

            # if empty just return empty array to mirror R4 FHIR functionality
            json_response(searchResults)

        else
            render :json => "Unknown Resource type: #{type}, valid resource types are : #{validTypes}", :status => 404
            return
        end

    end

end