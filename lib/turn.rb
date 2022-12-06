require './lib/board'
require './lib/player'

class Turn
    attr_reader :name, :board, :player1
    def initialize(player1, board)
    @board = board
    @player1 = player1
    end

    # We need user input to indicate column entry
    # Check to see if column has "." at the top row
    # If top position is ".", drop piece to lowest empty column space


    def open_column?(user_input)
        if user_input == "A" && @board.game_board[0][0] == "."
            true
        elsif user_input == "B" && @board.game_board[0][1] == "."
            true  
        elsif user_input == "C" && @board.game_board[0][2] == "."
            true 
        elsif user_input == "D" && @board.game_board[0][3] == "."
            true  
        elsif user_input == "E" && @board.game_board[0][4] == "."
            true 
        elsif user_input == "F" && @board.game_board[0][5] == "."
            true 
        elsif user_input == "G" && @board.game_board[0][6] == "."
            true
        else 
            false
        end

    end

    def place_piece(column)
        @game.game_board

    end
end