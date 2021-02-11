require 'minitest/autorun'
require_relative 'day3'

class TestDay3 < Minitest::Test
  def setup
    @puzzle = Puzzle.new('day3/input.txt')
  end

  def test_reads_input_file_and_initializes
    assert !@puzzle.input.nil?, 'input file not read'
  end

  def test_input_should_be_a_single_string
    assert @puzzle.input.class == String,
      'input file should be a single string'
  end

  def test_counts_houses_visited
    # case 1
    @puzzle.input = '>'
    @puzzle.houses_visited = []

    @puzzle.travel

    assert_equal 2, @puzzle.houses_visited_count, 'Wrong output'

    # case 2
    @puzzle.input = '^>v<'
    @puzzle.houses_visited = []

    @puzzle.travel

    assert_equal 4, @puzzle.houses_visited_count, 'Wrong output'

    # case 3 
    @puzzle.input = '^v^v^v^v^v'
    @puzzle.houses_visited = []

    @puzzle.travel

    assert_equal 2, @puzzle.houses_visited_count, 'Wrong output'
  end

  def test_travel_parses_instructions
    # case 1
    @puzzle.input = '>'
    @puzzle.houses_visited = []
    expected = [[0, 0],
                [1 ,0]]

    @puzzle.travel
    assert_equal expected, @puzzle.houses_visited,
                'Instructions incorrectly parsed'

    # case 2
    @puzzle.input = '^>v<'
    @puzzle.houses_visited = []
    expected = [[0, 0],
                [0 ,1],
                [1, 1],
                [1, 0],
                [0, 0]]

    @puzzle.travel
    assert_equal expected, @puzzle.houses_visited,
                 'Instructions incorrectly parsed'

    # case 3
    @puzzle.input = '^v^v^v^v^v'
    @puzzle.houses_visited = []
    expected = [[0, 0],
                [0, 1],
                [0, 0],
                [0, 1],
                [0, 0],
                [0, 1],
                [0, 0],
                [0, 1],
                [0, 0],
                [0, 1],
                [0, 0]]

    @puzzle.travel
    assert_equal expected, @puzzle.houses_visited,
                 'Instructions incorrectly parsed'
  end

  def test_counts_houses_visited_by_both
    # case 1
    @puzzle.input = '^v'
    @puzzle.houses_visited_by_santa = []
    @puzzle.houses_visited_by_robot = []

    @puzzle.travel_both

    assert_equal 3, @puzzle.houses_visited_by_both_count, 'Wrong output'

    # case 2
    @puzzle.input = '^>v<'
    @puzzle.houses_visited_by_santa = []
    @puzzle.houses_visited_by_robot = []

    @puzzle.travel_both

    assert_equal 3, @puzzle.houses_visited_by_both_count, 'Wrong output'

    # case 3 
    @puzzle.input = '^v^v^v^v^v'
    @puzzle.houses_visited_by_santa = []
    @puzzle.houses_visited_by_robot = []

    @puzzle.travel_both

    assert_equal 11, @puzzle.houses_visited_by_both_count, 'Wrong output'
  end

  def test_travel_both_parses_instructions
        # case 1
        @puzzle.input = '^v'
        @puzzle.houses_visited_by_santa = []
        @puzzle.houses_visited_by_robot = []
        expected_santa = [[0, 0],
                          [0 ,1]]
        expected_robot = [[0, 0],
                          [0 ,-1]]
    
        @puzzle.travel_both
        assert_equal expected_santa, @puzzle.houses_visited_by_santa,
                    'Instructions incorrectly parsed'
        assert_equal expected_robot, @puzzle.houses_visited_by_robot,
                    'Instructions incorrectly parsed'
    
        # case 2
        @puzzle.input = '^>v<'
        @puzzle.houses_visited_by_santa = []
        @puzzle.houses_visited_by_robot = []
        expected_santa = [[0, 0],
                          [0 ,1],
                          [0, 0]]
        expected_robot =  [[0, 0],
                           [1, 0],
                           [0, 0]]
    
        @puzzle.travel_both
        assert_equal expected_santa, @puzzle.houses_visited_by_santa,
                    'Instructions incorrectly parsed'
        assert_equal expected_robot, @puzzle.houses_visited_by_robot,
                    'Instructions incorrectly parsed'
    
        # case 3
        @puzzle.input = '^v^v^v^v^v'
        @puzzle.houses_visited_by_santa = []
        @puzzle.houses_visited_by_robot = []
        expected_santa = [[0, 0],
                          [0, 1],
                          [0, 2],
                          [0, 3],
                          [0, 4],
                          [0, 5]]
        expected_robot = [[0, 0],
                          [0, -1],
                          [0, -2],
                          [0, -3],
                          [0, -4],
                          [0, -5]]
    
        @puzzle.travel_both
        assert_equal expected_santa, @puzzle.houses_visited_by_santa,
                    'Instructions incorrectly parsed'
        assert_equal expected_robot, @puzzle.houses_visited_by_robot,
                    'Instructions incorrectly parsed'
  end

end
