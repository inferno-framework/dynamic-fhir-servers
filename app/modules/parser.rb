module parser

    def parse()
        file = ""
        # read first json file it encounters for now
        Dir["**/*.json"].each do |json_file|
            file = JSON.parse(File.read(json_file))
            break
        end
    end

end