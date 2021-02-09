class Puzzle
  def initialize(input_file_name)
    # Initialization code
    @input = []
    @boxes = []
    File.open(input_file_name).each_line do |line|
      @input << line
    end
  end

  attr_accessor :input, :boxes

  def parse_input
    @input.each do |box_str|
      @boxes << parse_string(box_str)
    end
  end

  def parse_string(box_str)
    box_arr = box_str.match(/(\d+)x(\d+)x(\d+)/).to_a.drop(1).map { |str| str.to_i }
    Box.new(box_arr)
  end

  def add_paper
    @boxes.inject(0) { |sum, box| sum += box.paper }
  end

  def add_ribbon
    @boxes.inject(0) { |sum, box| sum += box.ribbon }
  end

end

class Box
  def initialize(dimensions)
    @dimensions = dimensions
  end

  attr_accessor :dimensions
  
  def paper
    sides_areas = @dimensions.combination(2)
                             .map { |comb| comb[0] * comb[1] }
    sides_areas.sum * 2 + sides_areas.min
  end

  def ribbon
    sides_perimeters = @dimensions.combination(2)
                                  .map { |comb| 2 * (comb[0] + comb[1]) }
    volume = @dimensions.inject(:*)
    return sides_perimeters.min + volume
  end

end

puzzle = Puzzle.new('day2/input.txt')
puzzle.parse_input
paper = puzzle.add_paper
puts "Sq. feet of paper: #{paper}"
ribbon = puzzle.add_ribbon
puts "ft. of ribbon: #{ribbon}"