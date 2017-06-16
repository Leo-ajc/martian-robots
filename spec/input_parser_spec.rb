require 'spec_helper'
require 'input_parser'

describe InputParser do
  include InputParser
  it 'parses the input into something Ruby can use' do
    mars = parse_input('spec/fixtures/sample_input.txt')
    expect(
      mars.robots
    ).to eq(
      [
        [{:x=>1, :y=>1}, "E", "RFRFRFRF"],
        [{:x=>3, :y=>2}, "N", "FRRFLLFFRRFLL"],
        [{:x=>0, :y=>3}, "W", "LLFFFLFLFL"]
      ]
    )
  end
end
