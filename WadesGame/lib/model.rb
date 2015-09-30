require 'model/monster'
require 'model/item'
require 'model/weapon'
require 'model/armor'
require 'model/potion'

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
    @board = @initial_board.split(/\n/).each do |ln|
      ln.each_char { |ch| whats_here(ch) }
    end
    @start = [3, 0]
  end

  def whats_here(location)
    clazz = OBJECTS[location]
    return nil if clazz.nil?
    clazz.new
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
