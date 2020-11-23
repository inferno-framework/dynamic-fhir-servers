# frozen_string_literal: true

module Parser
  def parse
    file = ''
    # read first json file it encounters for now
    # make json file name configurable in future for capability statement
    Dir["**/app/jsonfiles/#{Rails.configuration.capabilityStatementName}"].each do |json_file|
      return (JSON.parse(File.read(json_file)))['rest'][0]['resource']
    end
  end
end
