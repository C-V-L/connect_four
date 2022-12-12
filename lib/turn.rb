class Turn
  attr_reader :name, :board, :player1, :computer_player

  def initialize(player1, board)
    @board = board
    @player1 = player1
    @computer_player = Player.new("Computer", "O")
  end

  def check_win_horizontal
    board.game_board.find do |row|
      if row.join.include?("XXXX") == true
        return player1
      elsif row.join.include?("OOOO") == true
        return computer_player
      end
    end
  end

  def check_win_vertical
    board.game_board.transpose.find do |row|
      if row.join.include?("XXXX") == true
        return player1
      elsif row.join.include?("OOOO") == true
        return computer_player
      end
    end
  end

  def check_win_diagonal_downward
    diag1 = [@board.game_board[0][0], @board.game_board[1][1],@board.game_board[2][2],
              @board.game_board[3][3],@board.game_board[4][4],@board.game_board[5][5]]
    diag2 = [@board.game_board[0][1], @board.game_board[1][2],@board.game_board[2][3],
              @board.game_board[3][4],@board.game_board[4][5],@board.game_board[5][6]]
    diag3 = [@board.game_board[0][2], @board.game_board[1][3],@board.game_board[2][4],
              @board.game_board[3][5],@board.game_board[4][6]]
    diag4 = [@board.game_board[1][0], @board.game_board[2][1],@board.game_board[3][2],
              @board.game_board[4][3],@board.game_board[5][4]]
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
      end
    end
  end

  def check_win_diagonal_upward 
    inverted_board = @board.game_board.reverse

      diag1 = [inverted_board[0][0], inverted_board[1][1],inverted_board[2][2],
                inverted_board[3][3],inverted_board[4][4],inverted_board[5][5]]
      diag2 = [inverted_board[0][1], inverted_board[1][2],inverted_board[2][3],
                inverted_board[3][4],inverted_board[4][5],inverted_board[5][6]]
      diag3 = [inverted_board[0][2], inverted_board[1][3],inverted_board[2][4],
                inverted_board[3][5],inverted_board[4][6]]
      diag4 = [inverted_board[1][0], inverted_board[2][1],inverted_board[3][2],
                inverted_board[4][3],inverted_board[5][4]]
      diag5 = [inverted_board[0][3], inverted_board[1][4],inverted_board[2][5],
                inverted_board[3][6]]
      diag6 = [inverted_board[2][0], inverted_board[3][1],inverted_board[4][2],
                inverted_board[5][3]]

      posible_diagonals = [diag1, diag2, diag3, diag4, diag5, diag6]
  
      posible_diagonals.find do |diagonal|
        if diagonal.join.include?("XXXX") == true
          return player1
        elsif diagonal.join.include?("OOOO") == true
          return computer_player
        end
      end
    end
    
  def check_all_wins
    if check_win_diagonal_downward != nil
      check_win_diagonal_downward
    elsif check_win_diagonal_upward != nil
      check_win_diagonal_upward
    elsif check_win_horizontal != nil
      check_win_horizontal 
    elsif check_win_vertical != nil
      check_win_vertical 
    else 
      false 
    end 
  end
end 


