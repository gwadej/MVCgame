require 'model/monster'
require 'model/item'
require 'model/weapon'
require 'model/armor'
require 'model/potion'

class Wall
  def contact(_player)
    :wall
  end

  def affect(_playeri, game)
    game.message('Bonk!')
  end
end

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
  attr_reader :board, :position, :bbox

  def initialize
    load_board
    @board = @initial_board.split(/\n/).each do |ln|
      ln.each_char { |ch| what_is_it(ch) }
    end
    @position = [3, 0]
    @bbox = [@board[0].size+1, @board.size] # add one for newline
  end

  def load_board
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
  end

  def clear?(x, y)
    whats_there(x, y).nil?
  end

  def whats_there(x, y)
    board[x][y]
  end

  def move(offset)
    new_pos = [position[0] + offset[0], position[1] + offset[1]]
    if clear?(new_pos[0], new_pos[1])
      @position = new_pos
      nil
    else
      board[new_pos[0]][new_pos[1]]
    end
  end

  def clear_spot(offset)
    new_pos = position + offset
    board[new_pos[0]][new_pos[1]] = nil
  end

  def display_board
    board = String.new(@initial_board)
    board[position[0] + position[1] * bbox[0]] = '@'
    board
  end

  private

  def board
    @board
  end

  def what_is_it(location)
    clazz = OBJECTS[location]
    return nil if clazz.nil?
    clazz.new
  end
end
