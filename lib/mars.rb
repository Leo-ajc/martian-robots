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
    self
  end

  def move_robot(move_sequence)
    move_sequence.split("").each do |letter|
      case letter
      when 'F'
        robots.first.move
      when 'L', 'R'
        'foo'
      end
    end
    self
  end
end
