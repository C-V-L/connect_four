require 'rspec'
require 'pry'
require './lib/board'
require './lib/player'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
    it 'exists' do
        board = Board.new
        player1 = Player.new("Benedict", "X")
        turn = Turn.new(player1, board)
        game = Game.new
        expect(game).to be_a(Game)

    end
end