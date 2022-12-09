
class Game
    attr_reader :turn, :player, :board
    def initialize
        @board = Board.new
        @player1 = Player.new(" ", "X")
        @turn = Turn.new(@player1, @board)
    end

    def create_player
        puts "Hello, player! Please enter your name below"
        user_name_entry = gets.chomp.capitalize
        @player = Player.new(user_name_entry, "X")
    end

    def welcome_message
        puts "Welcome to CONNECT FOUR"
        puts "Please enter p to play or q to quit"
        user_welcome_entry = gets.chomp.capitalize
        if user_welcome_entry.downcase == "p"
            create_player
        elsif user_welcome_entry.downcase == 'q'
            exit
        else
            puts "Invalid selection. Please enter p or q"
            self.welcome_message
        end

    end

    def print_board
        puts "
        A B C D E F G
        #{board.game_board[0].join(" ")}
        #{board.game_board[1].join(" ")}
        #{board.game_board[2].join(" ")}
        #{board.game_board[3].join(" ")}
        #{board.game_board[4].join(" ")}
        #{board.game_board[5].join(" ")}
        "
    end
    def play_connect_four
    
        
        until (turn.check_win_diagonal_downward != nil) || (turn.check_win_diagonal_upward != nil) ||
              (turn.check_win_horizontal != nil) || (turn.check_win_vertical != nil) || (check_for_draw == true)

            puts "Choose a column from A - G to place your piece" 
            user_column_choice = gets.chomp.upcase

            if turn.open_column?(user_column_choice) == true 
              
                turn.place_piece(user_column_choice)
                computer_turn = turn.computer_selection
                turn.computer_place_piece(computer_turn)
                print_board
              
                turn.check_win_diagonal_downward
                turn.check_win_diagonal_upward
                turn.check_win_horizontal
                turn.check_win_vertical

                if @turn.check_all_wins == @player1
                     puts "Congrats, #{turn.check_all_wins.name}! You won!"
                     break
                elsif @turn.check_all_wins == turn.computer_player
                     puts "I won!"
                    break
                elsif turn.check_all_wins == false && check_for_draw == true 
                     puts "It's a draw. Everyone loses"
                     break
                end 
                
             
                
            else  
                
                puts "#{user_column_choice}: This is not an available column"
                self.play_connect_four
            end
        end

        # if @turn.check_all_wins.name == @player1.name 
        #      puts   "Congrats, #{turn.check_all_wins.name}! You won!"
        # elsif @turn.check_all_wins == turn.computer_player
        #     puts "I won!"
        # else 
        #     puts "It's a draw. Everyone loses"
        # end
    
    end

    def check_for_draw
        if @board.game_board[0].include?(".") == false 
            true 
        else
            false
        end
    end
end
