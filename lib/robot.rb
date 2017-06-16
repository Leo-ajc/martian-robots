class Robot
  ORIENTATIONS_RAD = [0.0,0.5,1.0,1.5].freeze

  attr_accessor :current_pos, :current_orientation, :lost

  def initialize(pos, orientation)
    @current_pos = pos
    @current_orientation = orientation
  end

  def move(magnitude=1)
    pos2 = projected_pos(magnitude)
    current_pos[:x] = pos2[:x]
    current_pos[:y] = pos2[:y]
    self
  end

  def projected_pos(magnitude=1)
    p2 = {
      x: (magnitude * Math.sin(@current_orientation * Math::PI)).to_i,
      y: (magnitude * Math.cos(@current_orientation * Math::PI)).to_i
    }
    return {
      x: current_pos[:x] + p2[:x],
      y: current_pos[:y] + p2[:y]
    }
  end

  def change_orientation(phi)
    current_index = ORIENTATIONS_RAD.find_index(@current_orientation)
    if phi == 'R'
      # Edge case doing > 360 should not return nil. Write test.
      @current_orientation = ORIENTATIONS_RAD[(current_index + 1) % ORIENTATIONS_RAD.count]
    elsif phi == 'L'
      @current_orientation = ORIENTATIONS_RAD[(current_index - 1) % ORIENTATIONS_RAD.count]
    end
    self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.where(search_arguments)
    results = []
    search_arguments.each do |k,v|
      results << all.select do |robot|
        robot.send(k) == v
      end
    end
    results.reduce(:&)
  end
end
