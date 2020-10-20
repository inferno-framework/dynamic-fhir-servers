class ReadController < ApplicationController
    def getById
        file = ""
        # read first json file it encounters for now
        Dir["**/*.json"].each do |json_file|
            file = JSON.parse(File.read(json_file))
            break
        end

        # parse json file for read requests that need to be supported
        # rest[0].resource get the whole list
        # all the reads are same format base/type/id, search params for use later on
        # json_response(file["rest"][0]["resource"][0]["type"]) to get the name of the endpoint
        # rest.resource.interaction is a list and each item has a .code that tells what it should have
        # for read if it contains read then that is one we are looking for

        resources = file["rest"][0]["resource"]

        resources.each do |i|
            puts i["type"]
        end

        


        json_response(file["rest"][0]["resource"][0])
        #json_response("testingGetById")
    end

    def getType
        file = ""
        # read first json file it encounters for now
        Dir["**/*.json"].each do |json_file|
            file = JSON.parse(File.read(json_file))
            break
        end
 
        resources = file["rest"][0]["resource"]

        validTypes = Array.new

        resources.each do |i|
            puts i["type"]
            validTypes.push(i["type"])
        end

        test = params[:type]
        id = params[:id]

        # here we would query our DB for the type if it's a valid type and then lookup the id
        # so for allergy intolerance we have an allergy intolerance table and lookup the id


        json_response(validTypes)
    end
end