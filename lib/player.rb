class Player
  attr_reader :name, :symbol

  def initialize(name, symbol = nil)
    @name = name
    @symbol = symbol
  end
end
def create_player(name,symbol)
  Player.new(name,symbol)
end
