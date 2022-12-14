require 'rspec'
require 'pry'
require './lib/board'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
  it 'exists and has players' do
    board = Board.new
    player1 = Player.new("Benedict", "X")
    turn = Turn.new(player1, board)
    expect(turn.player1).to eq(player1)
    expect(turn.board).to eq(board)
    expect(turn.player2).to be_a(Player)
  end

  describe '#check_win_horizontal' do
    it 'can check for a horizontal win' do
      board = Board.new
      player1 = Player.new("Benedict", "X")
      turn = Turn.new(player1, board)
      turn.board.game_board[0][0] = "X"
      turn.board.game_board[0][1] = "X"
      turn.board.game_board[0][2] = "X"
      turn.board.game_board[0][3] = "X"
      expect(turn.check_win_horizontal).to be(turn.player1)
    end
  end

  describe '#check_win_vertical' do
    it 'can check for vert win' do
      board = Board.new
      player1 = Player.new("Benedict", "X")
      turn = Turn.new(player1, board)
      turn.board.game_board[0][0] = "O"
      turn.board.game_board[1][0] = "O"
      turn.board.game_board[2][0] = "O"
      turn.board.game_board[3][0] = "O"
      expect(turn.check_win_vertical).to eq(turn.player2)
    end

    it 'can check for vert win' do
      board = Board.new
      player1 = Player.new("Benedict", "X")
      turn = Turn.new(player1, board)
      turn.board.game_board[0][5] = "O"
      turn.board.game_board[1][5] = "O"
      turn.board.game_board[2][5] = "O"
      turn.board.game_board[3][5] = "O"     
      expect(turn.check_win_vertical).to eq(turn.player2)
    end
  end

  describe '#check_win_diagonal' do
    it 'can check for downward diag win' do
      board = Board.new
      player1 = Player.new("Benedict", "X")
      turn = Turn.new(player1, board)
      turn.board.game_board[0][0] = "X"
      turn.board.game_board[1][1] = "X"
      turn.board.game_board[2][2] = "X"
      turn.board.game_board[3][3] = "X"
      expect(turn.check_win_diagonal_downward).to be(turn.player1)
    end

    it 'can check for upward diag win' do
      board = Board.new
      player1 = Player.new("Benedict", "X")
      turn = Turn.new(player1, board)
      turn.board.game_board[5][0] = "X"
      turn.board.game_board[4][1] = "X"
      turn.board.game_board[3][2] = "X"
      turn.board.game_board[2][3] = "X"
      expect(turn.check_win_diagonal_upward).to be(turn.player1)
    end
  end

  it 'can check for draw' do
    board = Board.new
    player1 = Player.new("Benedict", "X")
    turn = Turn.new(player1, board)

    expect(turn.check_for_draw).to eq false 
  
    turn.board.game_board = 
      [["Y","Y","Y","Y","Y","Y","Y"],
      ["Y","Y","Y","Y","Y","Y","Y"],
      ["Y","Y","Y","Y","Y","Y","Y"],
      ["Y","Y","Y","Y","Y","Y","Y"],
      ["Y","Y","Y","Y","Y","Y","Y"],
      ["Y","Y","Y","Y","Y","Y","Y"]]
    expect(turn.check_for_draw).to be true
  end
end