require "json"
require_relative 'models/communication'

# First, let's define the function to create our instances variables, from the json data
json_data = JSON.parse(File.read('data.json'))

def generate_communications(json_data)
  practitioners_hash = {}
  communications = []

  json_data["practitioners"].each do |prac|
    practitioners_hash[prac["id"]] = prac["express_delivery"]
  end

  json_data["communications"].each do |com|
    communications << Communication.new(com["id"], com["pages_number"], com["color"], com["sent_at"], practitioners_hash[com["practitioner_id"]])
  end

  communications
end

# Then, define two functions to generate the output file...
def convert_hash_structure(hash)
  array_of_hashes = []
  hash.each_key { |key| array_of_hashes << { "sent_on" => key, "total" => hash[key] } }
  {"totals" => array_of_hashes}
end

def generate_json_output(communications)
  sales = {}

  communications.each do |communication|
    day = communication.day_sent_at
    sales[day].nil? ? sales[day] = communication.cost_in_cents : sales[day] += communication.cost_in_cents
  end

  sales.transform_values! { |value| value.to_f / 100 }
  final_hash = convert_hash_structure(sales)
  JSON.pretty_generate(final_hash)
end

# ... and generate the file
communications = generate_communications(json_data)
json_output = generate_json_output(communications)

File.open("output.json","w") do |f|
  f.write(json_output)
end
