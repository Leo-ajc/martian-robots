require 'spec_helper'
require 'mars'

describe Mars do

  before(:each) do
    @mars_size = {x: 5, y: 3}
    @mars = Mars.new(5, 3)
  end

  describe '#initialize' do
    it 'sets instance variable' do
      expect(@mars.robots).to be_empty
    end
  end

  describe 'add_robot' do
    it 'stores Robot objects' do
      expect{
        @mars.add_robot({x: 2, y: 2}, 'W')
      }.to change{
        @mars.robots.count
      }.from(0).to(1)
    end
  end
end
