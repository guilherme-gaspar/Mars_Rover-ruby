require_relative 'directions.rb'

class RoverProblem
  DIRECTIONS = %w(N E S W).freeze

  attr_reader :face, :x, :y

  def initialize(max_x, max_y)
    @x = 0
    @y = 0
    @max_x = max_x.to_i
    @max_y = max_y.to_i
  end

  def deploy(x, y, face)
    @x = x.to_i
    @y = y.to_i
    @face = face
  end

  def process(commands)
    commands.each_char do |character|
      case character
      when 'L' then turn_left
      when 'R' then turn_right
      when 'M' then move_forward
      end
    end

    [@x, @y, @face].join(' ')
  end

  def self.parse(string)
    commands = string.split("\n")
    rover = new(*commands.delete_at(0).split(' '))

    output = ''

    commands.each_slice(2) do |deploy_coords, instructions|
      rover.deploy(*deploy_coords.split(' '))
      output << rover.process(instructions) + "\n"
    end

    puts output
  end

  private

  def face_to(operator, step)
    idx = DIRECTIONS.index(@face).method(operator).call(step) % 4
    @face = DIRECTIONS[idx]
  end


end