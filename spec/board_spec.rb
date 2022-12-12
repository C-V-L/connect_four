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

  describe '#place_piece' do 
    it 'can place a peice in lowest available row' do
    board = Board.new
    player1 = Player.new("Benedict", "X")
    turn = Turn.new(player1, board)

    board.place_piece('A')
    expect(board.game_board[5][0]).to eq("X")
    board.place_piece('A')
    expect(board.game_board[4][0]).to eq("X")
    board.place_piece('C')
    expect(board.game_board[5][2]).to eq("X")
    end
  end

  describe'#computer_selection' do 
    it 'select a random valid placement for the board' do 
      board = Board.new
      player1 = Player.new("Benedict", "X")
      turn = Turn.new(player1, board)
      expect(board.computer_player).to be_a(Player)
      expect(board.open_column?(board.computer_selection)).to eq(true)
    end
  end

  describe '#computer_place_piece' do 
    it 'places the computers piece on the board' do 
    board = Board.new
    player1 = Player.new("Benedict", "X")
    turn = Turn.new(player1, board) 

    board.computer_place_piece(board.computer_selection)
    expect(board.game_board[5]).to include("O")
    end
  end

end