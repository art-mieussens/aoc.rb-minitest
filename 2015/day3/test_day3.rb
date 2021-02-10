require 'minitest/autorun'
require_relative day3

class TestDay3 < Minitest::Test
  def setup
    @puzzle = Puzzle.new('day3/input.txt')
  end

  # def test_reads_input_file_and_initializes
  #   assert !@puzzle.input.nil?, 'input file not read'
  #   assert @puzzle.floor == 0
  # end

  # def test_input_should_be_a_single_string
  #   assert @puzzle.input.class == String,
  #     'input file should be a single string'
  # end

end
