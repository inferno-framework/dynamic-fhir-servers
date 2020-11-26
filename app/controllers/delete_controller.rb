class DeleteController < ApplicationController
    def delete
        type = params[:type]
        id = params[:id]

        if !type.nil? && !id.nil?
            @connection = ActiveRecord::Base.connection
            result = @connection.exec_query("DELETE FROM allresourcetype where id = '#{id}' and lower(resource_type) = '#{type.downcase}'")
            json_response("Successfully deleted #{type} with id: #{id}")
        else
            render json: "Invalid parameters, please supply valid id and resource_type in order to delete a record", status: 400
        end

    end
end