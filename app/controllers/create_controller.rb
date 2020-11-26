class CreateController < ApplicationController
    def create
        body = request.body.read

        jsonBody = JSON.parse(body)

        if !jsonBody["id"].nil? && !jsonBody["resource_type"].nil? && !jsonBody["resource"].nil?
            @connection = ActiveRecord::Base.connection
            result = @connection.exec_query("INSERT INTO allresourcetype (id, resource_type, resource, txid) values ('#{jsonBody["id"]}', '#{jsonBody["resource_type"]}', '#{JSON.generate(jsonBody["resource"])}', '0')")
            json_response(jsonBody)
        else
            render json: "Invalid resource body, all created resources must have an id, resource_type, and resource", status: 400
        end

    end
end