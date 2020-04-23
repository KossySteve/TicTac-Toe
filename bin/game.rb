require '.bin/board.rb'

class Game
    def gameOver
       if board.full? == true
            puts "Game Over"
       end
    end

end