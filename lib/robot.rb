class Robot

  attr_accessor :current_pos

  def initialize(pos, orientation)
    @current_pos = pos
    @orientation = orientation
  end

  def move
    current_pos[:y] = current_pos[:y] + 1
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
