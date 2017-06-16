class Robot

  attr_accessor :current_pos, :current_orientation

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

  def change_orientation(direction)
    if direction == 'R'
      @current_orientation = 'N'
    elsif direction == 'L'
      @current_orientation = 'S'
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
