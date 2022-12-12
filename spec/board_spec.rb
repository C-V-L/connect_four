require 'rspec'
require 'pry'
require './lib/board'

RSpec.describe Board do
    it "Exists" do
        board = Board.new
        expect(board).to be_a(Board)
    end

    it 'has a game board' do
        board = Board.new
        expect(board.game_board.count).to eq(6)
    end
    
    describe '#open_column?' do
      it 'can check if selected row is available' do
        board = Board.new
        player1 = Player.new("Benedict", "X")
        turn = Turn.new(player1, board)
        expect(board.open_column?('A')).to eq(true)
        board.game_board[0][0] = "X"
        expect(board.open_column?('A')).to eq(false)
      end
    end

end