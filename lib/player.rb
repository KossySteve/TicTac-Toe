class Player
  attr_reader :name, :symbol

  def initialize(name, symbol = nil)
    @name = name
    @symbol = symbol
  end
end
