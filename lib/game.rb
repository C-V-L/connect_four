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
        "Enter p to play. Enter q to quit."
    end

end