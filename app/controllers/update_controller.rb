class UpdateController < ApplicationController
    def update
        type = params[:type]
        id = params[:id]
        body = request.body.read
        jsonBody = JSON.parse(body)

        if !type.nil? && !id.nil? && !jsonBody.nil?
            @connection = ActiveRecord::Base.connection
            result = @connection.exec_query("UPDATE allresourcetype SET resource = '#{JSON.generate(jsonBody)}' where id = '#{id}' and lower(resource_type) = '#{type.downcase}'")
            json_response("Successfully updated #{type} with id: #{id}")
        else
            render json: "Invalid parameters, please supply valid id and resource_type with a JSON body in order to update a record", status: 400
        end

    end
end