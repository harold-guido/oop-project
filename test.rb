class Hash
  def shuffle(size)
    Hash[self.to_a.sample(size)]
  end
end

pairs = {1 => "Yellow", 2 => "Red", 3 => "Blue", 4 => "Green", 5 => "Black", 6 => "White"}

random_colours = pairs.shuffle(4)
puts random_colours
