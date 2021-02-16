require 'digest'

START_00000 = /^00000/
START_000000 = /^000000/

class Puzzle
  def initialize
    @input = 'bgvyzdsv'
  end

  attr_accessor :input

  def mine
    counter = 0
    while !matches?(counter)
      counter += 1
    end
    return counter
  end

  def mine6
    counter = 0
    while !matches6?(counter)
      counter += 1
    end
    return counter
  end

  def matches?(counter)
    Digest::MD5.hexdigest(@input + counter.to_s).match(START_00000)
  end

  def matches6?(counter)
    Digest::MD5.hexdigest(@input + counter.to_s).match(START_000000)
  end

end

  puzzle = Puzzle.new
  puts puzzle.mine
  puts puzzle.mine6
