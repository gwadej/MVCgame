$LOAD_PATH.unshift( 'lib' )

require 'controller'

game = GameController.new

game.run!

puts
