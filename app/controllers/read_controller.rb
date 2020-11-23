# frozen_string_literal: true

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
      # json_response(validTypes)
      # here we would query our DB for the type if it's a valid type and then lookup the id
      # so for allergy intolerance we have an allergy intolerance table and lookup the id
      @connection = ActiveRecord::Base.connection
      # result = @connection.exec_query("SELECT resource FROM #{type} WHERE id = '#{id}'")
      result = @connection.exec_query("SELECT resource FROM allresourcetype WHERE id = '#{id}' and lower(resource_type) = '#{type.downcase}'")
      json_response(result[0])
    else
      render json: "Unknown Resource type: #{type}, valid resource types are : #{validTypes}", status: 404
    end
  end
end
