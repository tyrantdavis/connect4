require_relative 'player'

class Connect4
  def create_player(player, name = STDIN)
  	puts "Enter your name, or not, player #{player}?> "
  	name = gets.chomp
    name = "Player #{player}" if name.empty?
    name
  end

  def initiate_game(name1, name2)
    #TO DO
  end

  def play(input = STDIN, input2 = STDIN)
    player = 1
    player1 = create_player(player, input)
    player2 = create_player(player += 1, input2)
    game = initiate_game(player1, player2)
    game.start
  end
end
connect4 = Connect4.new
connect4.play
