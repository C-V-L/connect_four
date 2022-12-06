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

    #------------------------------------------------------------------

    # instead of calling place_piece in open_column?
    # maybe we can instead use a conditional statement when running
    # the turn, something like 

    # if open_column?(user_input) == true 
            #place_piece(user_input)
    # else
        # "Invalid placement or the slot is full, pick another column" 
        # "Enter 'A' - 'G"
    
    #------------------------------------------------------------------- 

    # to convert the user's input from a letter to the index point
    # that letter refers to, maybe this could be it's own method? 
    # That can be used in the place_piece method

    # def convert_letter_to_index(user_input)
    #   if user_input == 'A' 
    #       @board.game_board[0][0]
    #   elsif user_input == 'B'
    #       @board.game_board[0][1]
    #   elsif user_input == 'C' 
    #       @board.game_board == [0][2]
    #  ...
    #   else 
    #       something like "Not a letter between a-g"
    #   end 
    #  end

    #-------------------------------------------------------------------

    # def place_piece(user_input)
    #   user_chosen_column = convert_letter_to_index(user_input)

    #   @board.game_board.reverse.map do |row| 
    #       row.map do |column| 
    #           if row[0] == user_chosen_column 
    #               until row[0] == "." 
    #                   user_chosen_column = "X"
    #               end 
    #           end 
    #       end
    #   end
    # end
    #  
    #     until  == "."

    #     end
    # end


    def open_column?(user_input)
        if user_input == "A" && @board.game_board[0][0] == "."
            true
            #place_piece(user_input)
        elsif user_input == "B" && @board.game_board[0][1] == "."
            true  
            #place_piece(user_input)
        elsif user_input == "C" && @board.game_board[0][2] == "."
            true 
            #place_piece(user_input)
        elsif user_input == "D" && @board.game_board[0][3] == "."
            true  
            #place_piece(user_input)
        elsif user_input == "E" && @board.game_board[0][4] == "."
            true 
            #place_piece(user_input)
        elsif user_input == "F" && @board.game_board[0][5] == "."
            true 
            #place_piece(user_input)
        elsif user_input == "G" && @board.game_board[0][6] == "."
            true
            #place_piece(user_input)
        else 
            false
        end

    end

    # def place_piece(column)
    #     @board.game_board.reverse
    #     require 'pry'; binding.pry
    #     # until  == "."

    #     # end

    # end

    def place_piece(user_input)
      @board.game_board.reverse.map do |row| 
          row.map do |column| 
            if row[0] == board.game_board[0][3]
                # board.game_board[0][3] is just an example of a user_input
                # that has been converted to an index point
                # so far this works to change the "." to an "x" 

                #require 'pry'; binding.pry
              if row[0] == "." 
                board.game_board[0][3] = "X" # this will not be hard coded as [0][3]
                                             # it'll be the converted user's input   
              end
            end
          end
        end.reverse # because we reversed the whole array, we have to call 
                    # .reverse again to put it back in correct order
        require 'pry'; binding.pry
    end
end