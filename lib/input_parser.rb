require 'mars'

module InputParser
  def parse_input(input_file_location)

    input_file = File.readlines(input_file_location)

    mars = Mars.new(10,10)
    (1..input_file.length).step(3).each do |i| # not very robust...
      new_robot_params = input_file[i].strip.split(" ") # "1 1 E\n" >> ["1", "1", "E"]
      new_robot_pos = {
        x: new_robot_params[0].to_i,
        y: new_robot_params[1].to_i
      }
      new_robot_direction = new_robot_params[2]
      new_robot_movement = input_file[i+1].strip

      mars.robots << [
        new_robot_pos,
        new_robot_direction,
        new_robot_movement
      ]
    end
    return mars
  end
end
