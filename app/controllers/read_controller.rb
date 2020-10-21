class ReadController < ApplicationController
    include Parser
    def getById
        resources = parse()

        validTypes = Array.new

        resources.each do |i|
            puts i["type"]
            validTypes.push(i["type"].downcase)
        end

        type = params[:type]
        id = params[:id]

        # here we would query our DB for the type if it's a valid type and then lookup the id
        # so for allergy intolerance we have an allergy intolerance table and lookup the id
        
        if validTypes.include?(type.downcase)
            json_response(validTypes)
        else
            render :json => "Unknown Resource type: #{type}, valid resource types are : #{validTypes}", :status => 404
        end

        

        
    end
end