require 'monster'
require 'item'
require 'weapon'
require 'armor'
require 'potion'

OBJECTS = {
  ':' => Wall,
  '-' => Wall,
  '|' => Wall,
  'k' => Monster::Kobold,
  'g' => Monster::Goblin,
  'o' => Monster::Orc,
  't' => Monster::Troll,
  '$' => Item::Gold,
  '*' => Item::Diamond,
  '!' => Weapon::Dagger,
  ')' => Weapon::Sword,
  '+' => Weapon::Axe,
  '/' => Weapon::Staff,
  ']' => Armor::Leather,
  '[' => Armor::Ring,
  '%' => Armor::Chain,
  '#' => Armor::Plate,
  '.' => Potion::Water,
  ',' => Potion::MinorHealing,
  ';' => Potion::MajorHealing,
  '?' => Potion::Sleep
}

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

class Wall
  def contact(_player)
    :wall
  end
end
