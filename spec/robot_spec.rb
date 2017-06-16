require 'spec_helper'
require 'robot'

describe Robot do
  context 'instance methods' do
    before(:each) do
      # not using let because I need these instance
      # variables for testing below.
      @init_pos = {x: 1, y: 2}
      @init_orientation =  'N'
      @robot = Robot.new(@init_pos, @init_orientation)
    end

    describe '#initialize' do
      it 'sets instance variables' do
        expect(@robot.current_pos).to eq(@init_pos)
        expect(@robot.current_orientation).to eq(@init_orientation)
      end
    end

    describe '#change_orientation' do
      it 'changes the robot orientation' do
        expect{
          @robot.change_orientation('L')
        }.to change{
          @robot.current_orientation
        }.from('N').to('S')
      end
    end

    describe '#move' do
      it 'moves forward in the direction the robot is facing' do
        # implicitly tests #projective_pos
        final_pos = { # moving 'North'
          x: @init_pos[:x],
          y: @init_pos[:y] + 1
        }
        expect{ @robot.move }.to change{
          @robot.current_pos
        }.from( @init_pos ).to( final_pos )
      end
    end
  end

  context 'class methods' do
    before(:each) do
      # Not using 'let' because it is lazy loaded
      # ObjectSpace.each_object(self).to_a traverses
      # previously initialized robot objects.
      # https://ruby-doc.org/core-2.2.0/ObjectSpace.html
      @robot1_pos = {x: 1, y: 2}
      @robot1 = Robot.new(@robot1_pos, 'N')

      @robot2_pos = {x: 3, y: 4}
      @robot2 = Robot.new(@robot2_pos, 'S')

      @robot3_pos = {x: 5, y: 6}
      @robot3 = Robot.new(@robot3_pos, 'S')
    end

    describe '#self.where' do
      it 'returns an array based on query params' do
        expect(
          Robot.where({current_pos: @robot1_pos}).first
        ).to eq(
          @robot1
        )
        expect(
          Robot.where({current_pos: @robot2_pos}).first
        ).to eq(
          @robot2
        )
      end
    end

    describe '#self.all' do
      it 'returns an array of all initialized robot objects' do
        expect(Robot.all).to include(@robot1, @robot2, @robot3)
      end
    end
  end
end
