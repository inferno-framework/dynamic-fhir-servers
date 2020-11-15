# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  AllResourceType.create!(
      id: json_records['id'],
      txid: 0,
      ts: DateTime.now,
      resource_type: json_records['resourceType'],
      status: "created",
      resource: json_records
  )
end


