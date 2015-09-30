require 'monster'
require 'maze'

class GameField
  attr_reader :start
  @initial_board = <<EOM
:-: :-:-:-:-:-:-:-:-:-:-:-:-:-:
|      k|  [    |   |k   . g  |
:]: :-: : :-: : :g: : :-:-:-: :
|$| |     | | | |.| | |     | |
:-: : :-: : : : :-: : : :-: : :
|   |  k| |)  |   ; | |   |   |
: :-:-: : :-: :-:-:-: :-: :-:-:
|   | | | | |   |     | k |   |
: : : : : : : : : :-:-: :-: : :
| | |   | | |%| | |     |  k| |
:t: :-:-: : :-: : :-:-:-: :-: :
| |+|   g |    k| | k     |   |
:-: :-:-:-:-:-:-: : : :-: : :-:
|   |     |  o      |   | |   |
:k:-: : : : :-:-:-:-:;: : :-: :
|$ ,  | | | |       | | |  #| |
:-:-:-: :,: : :-:-:-: :}:-:-: :
|$    k | | | |    $| | |     |
: :-:-:-: :?: : :-: : : :o: :-:
| |    kg | |   | |   | |$|   |
: :$:-:-:-: :-:-: :-:-: :-:-: :
| |$|   |       |     | |     |
: :-: : : :-:-:-:-:-: : : :-: :
|   | | | |       |   | | |;  |
:-: : : : : :-:-:-: :-: : :-:-:
|   | | | o |     |   | | |  *|
: :-: : : :-: :-: :-: :t:t: : :
|     |      ;  |     | |   | |
:-:-:-:-:-:-:-:-:-:-:-:-:-:-:-:
EOM

  def initialize
    @board = @initial_board.split(/\n/).each { |ln| ln.each_char{ |ch| whats_here( ch ) } }
    @start = [3, 0]
  end

  def whats_here(location)
    spot = Maze.make_wall(location)
    spot = Monster.make_monster(location) if spot.nil?
    spot = Item.make_item(location) if spot.nil?
    spot
  end

  def clear?(x, y)
    whats_here(@board[x][y]).nil?
  end
end
