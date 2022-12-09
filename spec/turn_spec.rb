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
        expect(turn.computer_player).to be_a(Player)
    end

    describe '#open_column?' do
        it 'can check if selected row is available' do
            board = Board.new
            player1 = Player.new("Benedict", "X")
            turn = Turn.new(player1, board)
            expect(turn.open_column?('A')).to eq(true)
            turn.board.game_board[0][0] = "X"
            expect(turn.open_column?('A')).to eq(false)
        end
    end

   describe '#place_piece' do 
        it 'can place a peice in lowest available row' do
            board = Board.new
            player1 = Player.new("Benedict", "X")
            turn = Turn.new(player1, board)

            turn.place_piece('A')
            
            expect(turn.board.game_board[5][0]).to eq("X")
            turn.place_piece('A')
            expect(turn.board.game_board[4][0]).to eq("X")
            turn.place_piece('C')
            expect(turn.board.game_board[5][2]).to eq("X")
        
        end

    end

    describe'#computer_selection' do 
        it 'select a random valid placement for the board' do 
            board = Board.new
            player1 = Player.new("Benedict", "X")
            turn = Turn.new(player1, board)

            expect(turn.computer_player).to be_a(Player)
            expect(turn.open_column?(turn.computer_selection)).to eq(true)
        end
    end

    describe '#computer_place_piece' do 
        it 'places the computers piece on the board' do 
            board = Board.new
            player1 = Player.new("Benedict", "X")
            turn = Turn.new(player1, board) 

            turn.computer_place_piece(turn.computer_selection)
            expect(board.game_board[5]).to include("O")
        end
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
            expect(turn.check_win_vertical).to eq(turn.computer_player)
        end

        it 'can check for vert win' do
            board = Board.new
            player1 = Player.new("Benedict", "X")
            turn = Turn.new(player1, board)
            turn.board.game_board[0][5] = "O"
            turn.board.game_board[1][5] = "O"
            turn.board.game_board[2][5] = "O"
            turn.board.game_board[3][5] = "O"
           
            expect(turn.check_win_vertical).to eq(turn.computer_player)
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
end