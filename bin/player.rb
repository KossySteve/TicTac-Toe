class Player
  attr_reader :name,:symbol
  @@player_count = 0
  @@game_symbols = ["X", "O"]
  def initialize (name,symbol = nil)
    @@player_count += 1
    if @@player_count == 1
      puts 'Welcome to the game of Tic Tac Toe!!!'
      puts 'player 1 what is your name?'
      @name = "Josef" #gets.chomp.upcase
      puts " #{@name} choose your symbol either X or O to play "
      @symbol = "X" #gets.chomp.upcase
      @@game_symbols = @@game_symbols.reject{ |sym|  sym == symbol  }
    else
      puts 'Welcome to the game of Tic Tac Toe!!!'
      puts 'player 2 what is your name?'
      @name = "Steve" #gets.chomp.upcase
      @symbol = @@game_symbols[0]
    end
  end
    def see
      puts "I am #{@name} and my symbol is #{@symbol}"
    end
end
