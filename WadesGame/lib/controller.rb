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
        puts 'left'
        move_left
      when 'j'
        puts 'down'
        move_down
      when 'k'
        puts 'up'
        move_up
      when 'l'
        puts 'right'
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
    puts 'Bonk!' unless what.nil?
#    if !what.nil?
#      case what.contact
#      when :item
#        what.pick_up(player)
#      when :monster
#        what.attack(player)
#      end
#    end
  end
end
