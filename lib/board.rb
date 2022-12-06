class Board
    attr_reader :game_board
    def initialize
        @game_board = set_up_board
    end

    def set_up_board
        [[".",".",".",".",".",".","."],
        [".",".",".",".",".",".","."],
        [".",".",".",".",".",".","."],
        [".",".",".",".",".",".","."],
        [".",".",".",".",".",".","."],
        [".",".",".",".",".",".","."]]
    end
end