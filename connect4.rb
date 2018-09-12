require_relative 'board'
require_relative 'player'

class Connect4
  def create_player(player, name = STDIN)
  	puts "Enter your name, or not, player #{player}?> "
  	name = gets.chomp
    name = "Player #{player}" if name.empty?
    name.capitalize
  end

  def initiate_game(name1, name2)
    Board.new(name1, name2)
  end

  def play(input = STDIN, input2 = STDIN)
    player = 1
    player1 = create_player(player, input)
    player2 = create_player(player += 1, input2)
    game = initiate_game(player1, player2)
    game.start_game
  end
end
connect4 = Connect4.new
connect4.play
