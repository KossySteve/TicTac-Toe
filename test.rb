class Person
  attr_reader :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def see
    puts " My name is #{info} "
  end

  def find(_info)
    see
  end
end
man = Person.new('Eric', '+')
puts man.find('play')
