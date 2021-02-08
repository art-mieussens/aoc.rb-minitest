require 'minitest/autorun'
require_relative 'day1'

class TestDay1 < Minitest::Test
  def setup
    @puzzle = Puzzle.new('day1/input.txt')
  end

  def test_reads_input_file_and_initializes
    assert !@puzzle.input.nil?, 'input file not read'
    assert @puzzle.floor == 0
  end

  def test_input_should_be_a_single_string
    assert @puzzle.input.class == String,
      'input file should be a single string'
  end

  def test_left_parenthesis_goes_up_one_floor
    @puzzle.next_instruction('(')
    assert @puzzle.floor == 1, 'Should be 1'
  end

  def test_right_parenthesis_goes_down_one_floor
    @puzzle.next_instruction(')')
    assert @puzzle.floor == -1, 'Should be -1'
  end

  def test_keep_count_of_floors
    @puzzle.input = '()()'
    @puzzle.process
    assert @puzzle.floor == 0, 'Should be 0'
  end

  def test_records_first_basement_entrance
    @puzzle.input = '(()))()((()))))'
    @puzzle.process
    assert @puzzle.first_basement == 5, 'Should be 5'
  end

end