require 'rspec'
require 'pry'
require './lib/board'

RSpec.describe Board do
    it "Exists" do
        board = Board.new
        expect(board).to be_a(Board)
    end
    
end