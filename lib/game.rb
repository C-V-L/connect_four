
require 'time'

class Game
  attr_reader :turn, :player, :board
  def initialize
    @board = Board.new
    @player1 = Player.new("", "X")
    @computer_player = Player.new("BeepBoop", "O")
  end

  def create_player
    puts "Hello! Please enter your name below"
    user_name_entry = gets.chomp.capitalize
    @player1.name << user_name_entry
  end

  def welcome_message 
    puts "
      --------------------------------------------
               Welcome to CONNECT FOUR
          Please enter p to play or q to quit.
      --------------------------------------------
      "
      
    user_welcome_entry = gets.chomp.capitalize
      if user_welcome_entry.downcase == "p"
        user_chooses_play_options
    #     puts "Do you want to play with a friend or a machine?"
    #     puts "Type 'f' for friend or 'c' for computer."
    #      user_choice_of_player = gets.chomp.downcase 
    #      if user_choice_of_player == 'c'
    #       play_connect_four
    #      elsif == 'f'
    #       play_connect_four_with_friend
    #      else 
    #       "Please enter if you want to play with a friend(f) or computer(c)."
    #         user_choice_of_player = gets.chomp.downcase 
    #      end
      elsif user_welcome_entry.downcase == 'q'
        exit
      else
        puts "Invalid selection. Please enter p or q"
        self.welcome_message
      end

  end

  def print_board
     "
    A B C D E F G
    #{board.game_board[0].join(" ")}
    #{board.game_board[1].join(" ")}
    #{board.game_board[2].join(" ")}
    #{board.game_board[3].join(" ")}
    #{board.game_board[4].join(" ")}
    #{board.game_board[5].join(" ")}
    "
  end

  def start_time 
    @start_time ||= Time.now.freeze
  end

  def total_time
    time = Time.now.to_i - start_time.to_f 
    time.freeze
  end

  def play_connect_four
    
    @board = Board.new
    @player1 = Player.new("", "X")
    @turn = Turn.new(@player1, @board)
    create_player
    # start_time 
    
    puts print_board
        
      until (turn.check_win_diagonal_downward != nil) || (turn.check_win_diagonal_upward != nil) ||
            (turn.check_win_horizontal != nil) || (turn.check_win_vertical != nil) || (check_for_draw == true)

        puts "Choose a column from A - G to place your piece" 
        user_column_choice = gets.chomp.upcase

          if board.open_column?(user_column_choice) == true 
            board.place_piece(user_column_choice)
            computer_turn = board.computer_selection
            board.computer_place_piece(computer_turn)
            puts print_board
            turn.check_win_diagonal_downward
            turn.check_win_diagonal_upward
            turn.check_win_horizontal
            turn.check_win_vertical
            display_winner
      
          else       
            puts "#{user_column_choice}: This is not an available column"
          end
      end
    
  end

  def check_for_draw
    if @board.game_board[0].include?(".") == false 
      true 
    else
      false
    end
  end

  def display_winner 
    if @turn.check_all_wins == @player1
      puts "  ~*~*~*~ Congrats #{@player1.name}! You won! ~*~*~*~"
      #  record_end_time(total_time)   
       welcome_message
    elsif @turn.check_all_wins == @turn.computer_player
      puts "!--- HAHA Human! You lose! Yeah! ---!"
      welcome_message
    elsif turn.check_all_wins == false && check_for_draw == true 
      puts "It's a draw. Everyone loses :'("
      welcome_message
    end 
  end

  def record_end_time(time) 
    time_arr = []
    time_arr << time
    puts time_arr.sort
  end

  def user_chooses_play_options 
    puts "Do you want to play with a friend or a machine?"
    puts "Type 'f' for friend or 'c' for computer."
    user_choice_of_player = gets.chomp.downcase 
    if user_choice_of_player == 'c'
      play_connect_four
    elsif user_choice_of_player == 'f'
      play_connect_four_with_friend
    else 
      puts "Invalid selection. Please enter if you want to play with a friend(f) or computer(c)."
      self.user_chooses_play_options
    end
  end

  def play_connect_four_with_friend 
    puts "yeah boii"
  end
end
