require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'
require 'pry'

game = Game.new
game.welcome_message
game.print_board
#game.play_connect_four
