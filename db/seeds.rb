# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts(ENV["json_file"])

if ENV["json_file"] == 'package'
  json_list_file_path = File.join(File.dirname(__FILE__), "/seeds/package/example/")
  json_file_list = Dir.children(json_list_file_path)
  json_file_list_new = Array.new
  for i in json_file_list
    if i[0] != "."
      json_file_list_new.push(i)
    end
  end


  for i in json_file_list_new
    file_path = File.join(File.dirname(__FILE__), "/seeds/package/example/", i)
    json_records = JSON.parse(File.read(file_path))
    resource_type = json_records['resourceType']
    if resource_type == "Bundle"
      for i in json_records['entry']
        AllResourceType.create!(
            id: i['resource']['id'],
            txid: 0,
            ts: DateTime.now,
            resource_type: i['resource']['resourceType'],
            status: "created",
            resource: i['resource']
        )
      end
    end
    if resource_type != "Bundle"
      AllResourceType.create!(
          id: json_records['id'],
          txid: 0,
          ts: DateTime.now,
          resource_type: json_records['resourceType'],
          status: "created",
          resource: json_records
      )
    end
  end

end

if ENV["json_file"] == 'synthea'
  syn_json_list_file_path = File.join(File.dirname(__FILE__), "/seeds/synthea/")
  syn_json_file_list = Dir.children(syn_json_list_file_path)
  syn_json_file_list_new = Array.new
  for i in syn_json_file_list
    if i[0] != "."
      syn_json_file_list_new.push(i)
    end
  end

  for i in syn_json_file_list_new
    syn_file_path = File.join(File.dirname(__FILE__), "/seeds/synthea/", i)
    syn_json_records = JSON.parse(File.read(syn_file_path))
    syn_resource_type = syn_json_records['resourceType']
    if syn_resource_type == "Bundle"
      for i in syn_json_records['entry']
        AllResourceType.create!(
            id: i['resource']['id'],
            txid: 0,
            ts: DateTime.now,
            resource_type: i['resource']['resourceType'],
            status: "created",
            resource: i['resource']
        )
      end
    end
  end

end


