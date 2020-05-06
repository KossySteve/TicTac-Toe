class Player
  attr_reader :name, :symbol

  def initialize(name, symbol = nil)
    raise ArgumentError, 'Name can\'t be an Integer' if name.match(/^[0-9]+$/)
    @name = name
    @symbol = symbol
  end
end
def create_player(name,symbol)
  Player.new(name,symbol)
end
