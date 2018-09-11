require_relative 'player'

class Board
  attr_accessor :board, :columns, :current_player, :player1, :player2

  def initialize(p1_name, p2_name)
    @board = Array.new(7) {Array.new(6, ' ')}
    @columns = [1, 2, 3, 4, 5, 6, 7]
    @current_player = 1
    @player1 = Player.new(p1_name, 'R')
    @player2 = Player.new(p2_name, 'B')
  end

end
