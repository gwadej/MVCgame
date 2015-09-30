module Maze
  def make_wall(char)
    case char
    when '|', ':', '-'
      Wall.new(char)
    when ' '
      Floor.new
    end
  end

  class Wall
    attr_reader :char
    def initialize(char)
      @char = char
    end
  end

  class Floor
  end
end
