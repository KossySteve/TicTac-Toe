class Player
  attr_reader :name, :symbol
  $game_symbols = %w[X O]

  def initialize(name, symbol = nil)
    @name = name
    @symbol = symbol

  end
 
end
