require 'view'
require 'model'

class GameController
  @player = Player.new

  def run!
    loop do
      Display::display_board

      case Display::prompt '>'
      when '?' 
        Display::help
      when 'x'
        if Display::prompt('Do you really want to quit? ').downcase == 'y'
          exit
        end
      when 'h'
        @player.move_left
      when 'j'
        @player.move_down
      when 'k'
        @player.move_up
      when 'l'
        @player.move_right
      when 'i'
        Display::display_list(@player.inventory)
      when 'q'
        potion = Display::select(@player.inventory.select { |i| i.is_a? Potion })
        potion.quaff(@player)
      end
    end
  end
end
