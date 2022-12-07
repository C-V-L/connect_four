class Game
    attr_reader :turn, :player, :board
    def initialize
        @board = Board.new
        @player = create_player
        @turn = Turn.new(@player1, @board)
    end

    def create_player
        puts "Hello, player! Please enter your name below"
        user_name_entry = gets.chomp.capitalize
        player = Player.new(user_name_entry, "X")
    end

    def welcome_message
        "Welcome to CONNECT FOUR"
        "Please enter p to play or q to quit"
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

end