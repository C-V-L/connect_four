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

    it 'can print the board' do
        board = Board.new
        player1 = Player.new("Benedict", "X")
        turn = Turn.new(player1, board)
        game = Game.new
        expect(game.print_board).to be_a(String)

    end

    xit 'can check for a draw' do
      board = Board.new
      player1 = Player.new("Benedict", "X")
      turn = Turn.new(player1, board)
      game = Game.new
      game.board.game_board = [["X","X","X","X","X","X","X"],
        ["X","X","X","X","X","X","X"],
        ["X","X","X","X","X","X","X"],
        ["X","X","X","X","X","X","X"],
        ["X","X","X","X","X","X","X"],
        ["X","X","X","X","X","X","X"]]
      expect(game.check_for_draw).to be true
    end


end