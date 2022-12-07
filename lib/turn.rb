class Turn
  attr_reader :name, :board, :player1, :computer_player

  def initialize(player1, board)
    @board = board
    @player1 = player1
    @computer_player = Player.new("Computer", "O")
  end

    # use a conditional statement when running the turn
    # something like 

    # PLAYER TURN
    # player_input = gets.chomp
    # if open_column?(player_input) == true 
            #place_piece(player_input)
    # else
        # "Invalid placement or the slot is full, pick another column" 
        # "Enter 'A' - 'G"
    
    # COMPUTER TURN
    # computer_selection 
    # if open_column?(computer_selection) == true 
    #  place_piece(computer_selection)
    # else  
    #   computer_selection 
    #dunno yet
    
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

  def computer_selection 
    computer_selection_array = ["A", "B", "C", "D", "E", "F", "G"] 
    computer_input = computer_selection_array.shuffle!

    computer_input.find do |letter|
      if open_column?(letter) == true 
       letter
      end
    end
  end
end 


