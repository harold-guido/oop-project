class Hash
  def shuffle(size = 4)
    Hash[self.to_a.sample(size)]
  end
end

class Code
  attr_accessor :code

  def initialize()
    @colour_list = [{1 => Yellow"", 2 => "Red", 3 => "Blue", 4 => "Green", 5 => "Black", 6 => "White"}]
    @code = colour_list.shuffle()
  end

  def self.new_code 
    code = ""
    5.times do |i|
    end
  end
end

class Game
  def initialize(player_name)
    @player = player_name 
    @code = Code.code
  end

  def self.guess(guess)
  end
end

class Player
  attr_accessor :name, :guesses

  public
  def initialize(name)
    @name = name
    @guesses = 10
end

Code.new()
