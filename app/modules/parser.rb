module Parser

    def parse()
        file = ""
        # read first json file it encounters for now
        Dir["**/*.json"].each do |json_file|
            return (JSON.parse(File.read(json_file)))["rest"][0]["resource"]
        end
    end

end