require '.bin/board.rb'

class Game
    def gameOver
       if board.full? == true
            puts "Game Over"
       end
    end

    def start_game
        player1
    end

end