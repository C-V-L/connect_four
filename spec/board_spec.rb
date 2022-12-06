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
end