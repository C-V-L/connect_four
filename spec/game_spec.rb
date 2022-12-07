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

    it 'has a turn' do
        board = Board.new
        player1 = Player.new("Benedict", "X")
        turn = Turn.new(player1, board)
        game = Game.new
        expect(game.turn).to be_a(Turn)
        expect(game.turn.computer_player.piece).to eq("O")
    end

    it 'has a welcome message' do
        board = Board.new
        player1 = Player.new("Benedict", "X")
        turn = Turn.new(player1, board)
        game = Game.new
        expect(game.welcome_message).to include?(String)
    end
end