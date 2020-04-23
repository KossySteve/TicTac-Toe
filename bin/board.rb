class Board
    attr_accessor :field

    def initialize
        @field = [
            1,2,3,
            4,5,6,
            7,8,9
        ]
    end

    def show_board
        puts "#{@field[0]} | #{@field[1]} | #{@field[2]}"
        puts "--+---+---"
        puts "#{@field[3]} | #{@field[4]} | #{@field[5]}"
        puts "--+---+---"
        puts "#{@field[6]} | #{@field[7]} | #{@field[8]}"
        puts "--+---+---"
        
    end
end

board = Board.new
board.show_board