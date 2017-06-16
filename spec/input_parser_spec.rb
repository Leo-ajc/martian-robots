require 'spec_helper'
require 'input_parser'

describe InputParser do
  include InputParser
  it 'parses the input into something Ruby can use' do
    expect(
      parse_input('spec/fixtures/sample_input.txt')
    ).to eq(
      [
        {:add_robot=>[{:x=>1, :y=>1}, "E", "RFRFRFRF"]},
        {:add_robot=>[{:x=>3, :y=>2}, "N", "FRRFLLFFRRFLL"]},
        {:add_robot=>[{:x=>0, :y=>3}, "W", "LLFFFLFLFL"]}
      ]
    )
  end
end
