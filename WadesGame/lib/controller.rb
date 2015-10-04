require 'view'
require 'model'
require 'model/player'

# Controller class for the game
class GameController
  attr_reader :player, :field, :help
  def initialize
    @player = Player.new('you')
    @field = GameField.new
    @help = <<EOH
  Hit a character for an action

  ? - This help screen
  x - Exit the program
  h - Move/attack left
  j - Move/attack down
  k - Move/attack up
  l - Move/attack right
  i - Display inventory
  q - Select a potion and drink it
EOH
  end

  def run!
    loop do
      Display.display_board(field)

      case Display.promptc '>'
      when '?'
        Display.display(help)
      when 'x'
        return if Display.prompt_yn 'Do you really want to quit? '
      when 'h'
        move_left
      when 'j'
        move_down
      when 'k'
        move_up
      when 'l'
        move_right
      when 'i'
        Display.display_list(@player.inventory)
      when 'q'
        potion = Display.select(@player.inventory.select { |i| i.is_a? Potion })
        potion.quaff(@player) unless potion.nil?
      end
    end
  end

  def move_left
    move([-1, 0])
  end

  def move_right
    move([1, 0])
  end

  def move_up
    move([0, -1])
  end

  def move_down
    move([0, 1])
  end

  def move(offset)
    what = field.move(offset)
    unless what.nil?
      puts what
      what.affect(player, self)
    end
  end

  def message(msg)
    Display.display(msg)
  end
end
