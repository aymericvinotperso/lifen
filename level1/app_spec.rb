# rspec app_spec.rb

require 'rspec'

require_relative './app.rb'

RSpec.describe "Prices calculator", type: :model do
  let(:data)           { JSON.parse(File.read('data.json')) }
  let(:output)         { JSON.pretty_generate(JSON.parse(File.read('output.json'))) }
  let(:communications) { generate_communications(data) }
  it 'should generate a json file equal to output.json' do
    expect(generate_json_output(communications)).to eq(output)
  end
end
