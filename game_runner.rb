require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

game = Game.new
game.print_board
#require 'pry'; binding.pry
game.play_connect_four