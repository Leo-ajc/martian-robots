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
end
