require './lib/turn'
require './lib/player'

class Board < Turn
  attr_reader :player1, :player2
  attr_accessor :game_board
  def initialize
    @game_board = set_up_board
    @player1 = Player.new("", "X")
    @player2 = Player.new("", "O")
  end

  def set_up_board
    [[".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."],
    [".",".",".",".",".",".","."]]
  end

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
    game_board.reverse.find do |row| 
      if row[user_chosen_column] == "."
        row[user_chosen_column] = @player1.piece 
      end      
    end.reverse
  end

  def player2_place_piece(player_input)  
    user_chosen_column = convert_letter_to_index(player_input)
    game_board.reverse.find do |row| 
      if row[user_chosen_column] == "."
        row[user_chosen_column] = @player2.piece 
      end      
    end.reverse
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
    game_board.reverse.find do |row| 
      if row[user_chosen_column] == "."
        row[user_chosen_column] = @player2.piece 
      end      
    end.reverse
  end 

  def open_column?(player_input)
    if player_input == "A" && game_board[0][0] == "."
      true
    elsif player_input == "B" && game_board[0][1] == "."
      true  
    elsif player_input == "C" && game_board[0][2] == "."
      true 
    elsif player_input == "D" && game_board[0][3] == "."
      true  
    elsif player_input == "E" && game_board[0][4] == "."
      true 
    elsif player_input == "F" && game_board[0][5] == "."
      true 
    elsif player_input == "G" && game_board[0][6] == "."
      true
    else 
      false
    end
  end

end