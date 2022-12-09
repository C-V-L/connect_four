require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

game = Game.new
game.print_board
game.play_connect_four
#require 'pry'; binding.pry
x = 4