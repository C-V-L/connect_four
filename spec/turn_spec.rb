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
            #expect(turn.computer_selection).to include("A")

        end
    end
end