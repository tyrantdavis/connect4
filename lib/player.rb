class Player
  attr_accessor :name, :game_piece

  def initialize(name, game_piece)
    @name = name
    @game_piece = game_piece
  end

  def place_game_piece(columns, selection = STDIN)
    prompt = '>'
    print "\nSelect a column to place your game piece #{@name} gp: #{@game_piece}\n#{prompt}\s"
    move = selection.gets.strip.to_i

    while !columns.include?(move)
      print "That move is not allowed. Please select another move."
      move = selection.gets.strip.to_i
    end
    return move
  end

end
