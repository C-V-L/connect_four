require './lib/board'
require './lib/player'

class Turn
  attr_reader :name, :board, :player1

  def initialize(player1, board)
    @board = board
    @player1 = player1
  end


    # instead of calling place_piece in open_column?
    # maybe we can instead use a conditional statement when running
    # the turn, something like 

    # if open_column?(user_input) == true 
            #place_piece(user_input)
    # else
        # "Invalid placement or the slot is full, pick another column" 
        # "Enter 'A' - 'G"
    
    #------------------------------------------------------------------- 

    def convert_letter_to_index(player_input)
      if player_input == 'A' 
        0
      elsif player_input == 'B'
        1
      elsif player_input == 'C' 
        2
      elsif player_input == 'D' 
        3
      elsif player_input == 'E' 
        4
      elsif player_input == 'F' 
        5
      elsif player_input == 'G' 
        6
      else 
         "Not a letter between a-g"
      end 
    end


  def place_piece(player_input)  
    user_chosen_column = convert_letter_to_index(player_input)
    @board.game_board.reverse.find do |row| 
      if row[user_chosen_column] == "."
        row[user_chosen_column] = @player1.piece 
      end      
    end.reverse
  end
   

    def open_column?(player_input)
        if player_input == "A" && @board.game_board[0][0] == "."
            true
        elsif player_input == "B" && @board.game_board[0][1] == "."
            true  
        elsif player_input == "C" && @board.game_board[0][2] == "."
            true 
        elsif player_input == "D" && @board.game_board[0][3] == "."
            true  
        elsif player_input == "E" && @board.game_board[0][4] == "."
            true 
        elsif player_input == "F" && @board.game_board[0][5] == "."
            true 
        elsif player_input == "G" && @board.game_board[0][6] == "."
            true
        else 
            false
        end

    end
end