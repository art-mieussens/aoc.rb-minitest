require 'minitest/autorun'
require_relative 'day2'

class TestDay2 < Minitest::Test
  def setup
    @puzzle = Puzzle.new('day2/input.txt')
    @box1 = Box.new [2,3,4]
    @box2 = Box.new [1,1,10]
  end

  def test_reads_input_file_and_initializes
    assert !@puzzle.input.nil?, 'input file not read'
  end

  def test_input_should_be_an_array_of_strings
    assert @puzzle.input.instance_of?(Array),
           'input file should be an array'
    assert @puzzle.input.first.instance_of?(String),
           'input file should be an array of strings'
  end

  def test_string_parsed
     assert @puzzle.parse_string("12x3x45").dimensions == [12, 3, 45]
      'Parsing didn\'t give the right result'
  end

  def test_input_is_parsed_to_array_of_boxes
    @puzzle.parse_input

    assert @puzzle.boxes.instance_of?(Array), 'boxes should be an array'
    assert @puzzle.boxes[1].instance_of?(Box),
           'boxes elements should be boxes'
  end

  def test_calculates_paper_per_box
    assert @box1.paper == 58
    assert @box2.paper == 43
  end

  def test_adds_up_paper
    @puzzle.boxes = [@box1, @box2]

    assert @puzzle.add_paper == 58 + 43
  end

  def test_calculates_ribbon_per_box
    assert @box1.ribbon == 34
    assert @box2.ribbon == 14
  end

  def test_adds_up_ribbon
    @puzzle.boxes = [@box1, @box2]

    assert @puzzle.add_ribbon == 34 + 14
  end

end