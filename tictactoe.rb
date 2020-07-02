class Board
  attr_accessor :current_board
  
  public
  def initialize()
    @current_board = "1 | 2 | 3\n---------\n4 | 5 | 6\n---------\n7 | 8 | 9"
  end
  
  private
  def self.place_symbol(board, position, symbol)
    new_board = board.sub(position, symbol)
    new_board
  end
end

class Game
  attr_accessor :player1, :player2, :board

  def initialize(name_one, name_two)
    @player1 = Player.new(name_one, "o")
    @player2 = Player.new(name_two, "x")
    @board = Board.new
  end

  def play_round()
    puts @board.current_board
    puts @player1.name + " choose where to move!"

    position_choice = Game.valid_position(@board.current_board) 
    @player1.positions += position_choice

    @board.current_board = Board.place_symbol(@board.current_board, position_choice, "o")

     if @player1.positions.match?(/.*[123].*[123].*[123]|.*[456].*[456].*[456]|.*[789].*[789].*[789]|.*[147].*[147].*[147]|.*[258].*[258].*[258]|.*[369].*[369].*[369]|.*[159].*[159].*[159]|.*[357].*[357].*[357]/) 
      return 1     
     end

    puts @board.current_board
    puts @player2.name + " choose where to move!"

    position_choice = Game.valid_position(@board.current_board)
    @player2.positions += position_choice

    @board.current_board = Board.place_symbol(@board.current_board, position_choice, "x")

    if @player2.positions.match?(/.*[123].*[123].*[123]|.*[456].*[456].*[456]|.*[789].*[789].*[789]|.*[147].*[147].*[147]|.*[258].*[258].*[258]|.*[369].*[369].*[369]|.*[159].*[159].*[159]|.*[357].*[357].*[357]/) 
      return 2
    end 
    0
  end

  def self.valid_name(symbol)
    puts "Please enter #{symbol}'s name"
    return gets.chomp
  end

  def self.valid_position(current_board)
    position = ""
    i = 0
    while i == 0 do
      position = gets.chomp
      if current_board.include?(position)
        i += 1
      else
        puts "Place is not available, choose again!" 
      end
    end
    return position
  end
end

class Player
  attr_accessor :name, :symbol, :positions

  public
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @positions = ""
  end
end

game = Game.new(Game.valid_name("o"), Game.valid_name("x"))

9.times do |i|
  result = game.play_round()
  if result == 1 
    puts game.board.current_board
    puts game.player1.name + " wins!"
    break
  elsif result == 2
    puts game.board.current_board
    puts game.player2.name + " wins!"
    break
  end
end
