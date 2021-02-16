  require 'minitest/autorun'
  require_relative 'day4'

  class TestDay4 < Minitest::Test
    def setup
      @puzzle = Puzzle.new
    end

    def test_input_should_be_a_single_string
      assert @puzzle.input.instance_of?(String),
             'input file should be a single string'
    end

    def test_examples_succeed
      @puzzle.input = 'abcdef'
      assert_equal 609043, @puzzle.mine, 'example 1 failed'

      @puzzle.input = 'pqrstuv'
      assert_equal 1048970, @puzzle.mine, 'example 2 failed'
    end
  end
