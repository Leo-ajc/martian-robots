require 'robot'

class Mars

  attr_accessor :robots

  def initialize(x, y)
    @size = {x: x.to_i, y: y.to_i}
    @robots = []
  end

  def add_robot(pos, orientation)
    robot = Robot.new(pos, orientation)
    @robots << robot
  end
end
