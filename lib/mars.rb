require 'robot'

class Mars

  COMPASS_DIRECTION_MAP = { # using radians, easier with vector calculus.
    'N' => 0.0,
    'E' => 0.5,
    'S' => 1.0,
    'W' => 1.5
  }.freeze

  attr_accessor :robots

  def initialize(x, y)
    @size = {x: x.to_i, y: y.to_i}
    @robots = []
  end

  def add_robot(pos, orientation)
    if within_mars?(pos)
      robot = Robot.new(pos,compass_direction_to_rad(orientation))
      @robots << robot
    end # ignore commands to add robot outside Mars.
    self
  end

  def move_robot(pos, move_sequence)
    robot = Robot.where(current_pos: pos).first
    raise Error::EmptyCoordinates if !robot

    move_sequence.split("").each do |letter|
      case letter
      when 'F'
        if !within_mars?(robot.projected_pos)
          robot.lost = robot.current_pos
          robot.current_pos = nil
          break;
        elsif !robot_lost_here?(pos)
          robot.move
        end # ignore commands to move if robot lost here
      when 'L', 'R'
        robot.change_orientation(letter)
      end
      #to_output
    end
    self
  end

  private

  def robot_lost_here?(pos)
    !Robot.where(lost: pos).empty?
  end

  def within_mars?(pos)
    pos[:x].between?(0,@size[:x]) && pos[:y].between?(0,@size[:y])
  end

  def compass_direction_to_rad(compass_direction)
    COMPASS_DIRECTION_MAP[compass_direction]
  end

  def rad_to_compass_direction(rad)
    COMPASS_DIRECTION_MAP.key(rad)
  end

  module Error
    class OutsideMars < StandardError
      def initialize(msg="No actions outside Mars are allowed.")
        super
      end
    end
  end
end
