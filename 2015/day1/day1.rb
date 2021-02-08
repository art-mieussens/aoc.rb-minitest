class Puzzle
  def initialize(input_file_name)
    @input = File.open(input_file_name).read
    @floor = 0
    @counter = 0
  end

  attr_accessor :input, :floor, :first_basement

  def next_instruction(char)
    case char
    when '('
      @floor += 1
    when ')'
      @floor -= 1
    end
  end

  def process
    @input.split('').each do |instruction|
      next_instruction(instruction)
      @counter += 1
      if @floor == -1 and !@first_basement
        @first_basement = @counter
      end
    end
  end


end

puzzle = Puzzle.new('day1/input.txt')
puzzle.process
puts "the final floor is # #{ puzzle.floor }"
puts "the first basement entrace was on instruction # #{ puzzle.first_basement }"