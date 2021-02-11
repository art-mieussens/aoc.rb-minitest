class Puzzle
  def initialize(input_file_name)
    # Initialization code
    @input = File.open(input_file_name).read
    @houses_visited = []
    @houses_visited_by_santa = []
    @houses_visited_by_robot = []
  end

  attr_accessor :input,
                :houses_visited,
                :houses_visited_by_santa,
                :houses_visited_by_robot

  def houses_visited_count
    @houses_visited.uniq.length
  end

  def travel
    current_house = [0, 0]
    @houses_visited << current_house
    input.split('').each do |instruction|
      case instruction
      when '^'
        current_house = [ houses_visited.last[0], houses_visited.last[1] + 1 ]
        @houses_visited << current_house
      when 'v'
        current_house = [ houses_visited.last[0], houses_visited.last[1] - 1 ]
        @houses_visited << current_house
      when '>'
        current_house = [ houses_visited.last[0] + 1, houses_visited.last[1] ]
        @houses_visited << current_house
      when '<'
        current_house = [ houses_visited.last[0] - 1 , houses_visited.last[1] ]
        @houses_visited << current_house
      end
    end
  end

  def travel_both
    current_house_santa = [0, 0]
    current_house_robot = [0, 0]
    @houses_visited_by_santa << current_house_santa
    @houses_visited_by_robot << current_house_robot
    turn = 'santa'

    input.split('').each do |instruction|

      if turn == 'santa'
        case instruction
        when '^'
          current_house_santa = [ houses_visited_by_santa.last[0], houses_visited_by_santa.last[1] + 1 ]
          @houses_visited_by_santa << current_house_santa
        when 'v'
          current_house_santa = [ houses_visited_by_santa.last[0], houses_visited_by_santa.last[1] - 1 ]
          @houses_visited_by_santa << current_house_santa
        when '>'
          current_house_santa = [ houses_visited_by_santa.last[0] + 1, houses_visited_by_santa.last[1] ]
          @houses_visited_by_santa << current_house_santa
        when '<'
          current_house_santa = [ houses_visited_by_santa.last[0] - 1 , houses_visited_by_santa.last[1] ]
          @houses_visited_by_santa << current_house_santa
        end
        turn = 'robot'
      else
        case instruction
        when '^'
          current_house_robot = [ houses_visited_by_robot.last[0], houses_visited_by_robot.last[1] + 1 ]
          @houses_visited_by_robot << current_house_robot
        when 'v'
          current_house_robot = [ houses_visited_by_robot.last[0], houses_visited_by_robot.last[1] - 1 ]
          @houses_visited_by_robot << current_house_robot
        when '>'
          current_house_robot = [ houses_visited_by_robot.last[0] + 1, houses_visited_by_robot.last[1] ]
          @houses_visited_by_robot << current_house_robot
        when '<'
          current_house_robot = [ houses_visited_by_robot.last[0] - 1 , houses_visited_by_robot.last[1] ]
          @houses_visited_by_robot << current_house_robot
        end
        turn = 'santa'
      end

    end

  end

  def houses_visited_by_both_count
    (@houses_visited_by_santa + @houses_visited_by_robot).uniq.length
  end
end

puzzle = Puzzle.new('day3/input.txt')
puzzle.travel
puts "Santa visited #{puzzle.houses_visited_count} different houses."
puzzle.travel_both
puts "Santa and the robot together visited #{puzzle.houses_visited_by_both_count} different houses."
