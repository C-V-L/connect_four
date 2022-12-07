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
    # computer_play = place_piece(computer_selection) 
    # computer_place_piece(computer_play)
    
    # 
    #dunno yet, just jotting down ideas
    
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

  def computer_place_piece(computer_input)
    user_chosen_column = convert_letter_to_index(computer_input)
    @board.game_board.reverse.find do |row| 
      if row[user_chosen_column] == "."
        row[user_chosen_column] = @computer_player.piece 
      end      
    end.reverse
  end

# Needs to check sequential chacaters in each array
# If any array contains 4 sequential chars then win is determined
# convert each row to string using .join. 
# Then check to see if str contains "XXXX" or "OOOO"
  def check_win_horizontal
    board.game_board.find do |row|
      if row.join.include?("XXXX") == true
        return @player1
      elsif row.join.include?("OOOO") == true
        return @computer_player
      else
        return false
      end
    end
  end

  def check_win_vertical
    board.game_board.transpose.find do |row|
      if row.join.include?("XXXX") == true
        return @player1
      elsif row.join.include?("OOOO") == true
        return @computer_player
      else
        return false
      end
    end
  end

  def check_win_diagonal_downward

    #long diags
    diag1 = [@board.game_board[0][0], @board.game_board[1][1],@board.game_board[2][2],
              @board.game_board[3][3],@board.game_board[4][4],@board.game_board[5][5]]
    diag2 = [@board.game_board[0][1], @board.game_board[1][2],@board.game_board[2][3],
              @board.game_board[3][4],@board.game_board[4][5],@board.game_board[5][6]]
    #medium diags
    diag3 = [@board.game_board[0][2], @board.game_board[1][3],@board.game_board[2][4],
              @board.game_board[3][5],@board.game_board[4][6]]
    diag4 = [@board.game_board[1][0], @board.game_board[2][1],@board.game_board[3][2],
              @board.game_board[4][3],@board.game_board[5][4]]
    #short diags
    diag5 = [@board.game_board[0][3], @board.game_board[1][4],@board.game_board[2][5],
              @board.game_board[3][6]]
    diag6 = [@board.game_board[2][0], @board.game_board[3][1],@board.game_board[4][2],
              @board.game_board[5][3]]
    posible_diagonals = [diag1, diag2, diag3, diag4, diag5, diag6]

    posible_diagonals.find do |diagonal|
      if diagonal.join.include?("XXXX") == true
        return player1
      elsif diagonal.join.include?("OOOO") == true
        return computer_player
      else return false
      end
    end

  #   def check_win_diagonal_downward

  #     #long diags
  #     diag1 = [@board.game_board[0][0], @board.game_board[1][1],@board.game_board[2][2],
  #               @board.game_board[3][3],@board.game_board[4][4],@board.game_board[5][5]]
  #     diag2 = [@board.game_board[0][1], @board.game_board[1][2],@board.game_board[2][3],
  #               @board.game_board[3][4],@board.game_board[4][5],@board.game_board[5][6]]
  #     #medium diags
  #     diag3 = [@board.game_board[0][2], @board.game_board[1][3],@board.game_board[2][4],
  #               @board.game_board[3][5],@board.game_board[4][6]]
  #     diag4 = [@board.game_board[1][0], @board.game_board[2][1],@board.game_board[3][2],
  #               @board.game_board[4][3],@board.game_board[5][4]]
  #     #short diags
  #     diag5 = [@board.game_board[0][3], @board.game_board[1][4],@board.game_board[2][5],
  #               @board.game_board[3][6]]
  #     diag6 = [@board.game_board[2][0], @board.game_board[3][1],@board.game_board[4][2],
  #               @board.game_board[5][3]]
  #     posible_diagonals = [diag1, diag2, diag3, diag4, diag5, diag6]
  
  #     posible_diagonals.find do |diagonal|
  #       if diagonal.join.include?("XXXX") == true
  #         return player1
  #       elsif diagonal.join.include?("OOOO") == true
  #         return computer_player
  #       else return false
  #       end
  #     end
  #   end
  # end


end 


