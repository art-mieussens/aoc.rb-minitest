  require 'minitest/autorun'
  require_relative 'day4'

  class TestDay4 < Minitest::Test
    def setup
      @puzzle = Puzzle.new('day4/input.txt')
    end

    # def test_reads_input_file_and_initializes
    #   assert !@puzzle.input.nil?, 'input file not read'
    # end

    # def test_input_should_be_a_single_string
    #   assert @puzzle.input.instance_of?(String),
    #          'input file should be a single string'
    # end

  end
