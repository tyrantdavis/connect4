require_relative 'player'
require_relative 'WinScenarios'

class Board
  attr_accessor :board, :columns, :current_player, :player1, :player2

  def initialize(p1_name, p2_name)
    @board = Array.new(7) {Array.new(6, ' ')}
    @columns = [1, 2, 3, 4, 5, 6, 7]
    @current_player = 1
    @player1 = Player.new(p1_name, 'R')
    @player2 = Player.new(p2_name, 'B')
  end

  def start_game
    print_title
    render
    how_to_play
    check_turns
  end

  def print_title
    puts "CONNECT4"
  end

  def how_to_play
    puts <<-PLAY.gsub(/^\s+/,'')
    Welcome to CONNECT4!
    There are two players in this game. Each player will take a turn placing their respective "R" or "B" game piece into one of seven columns.'\n'
    The first player to get four in a row in a diagonal, horizontal, or vertical arrangement win the game.
    PLAY
  end

  def render
    render_string = "\n"

    (0..5).reverse_each do | row |
      render_string << "+---+---+---+---+---+---+---+\n"
      (0..6).each do | column |
        render_string << "| #{@board[column][row]} "
      end
      render_string << "|\n"
    end
    render_string << "+---+---+---+---+---+---+---+\n"
    render_string << '  1   2   3   4   5   6   7'
    puts render_string
  end

  def check_turns
    someone_won = false
    until @current_player > 42 || someone_won
      whose_turn?
      @current_player += 1
      render
      someone_won = check_win_status
    end

    if someone_won
      victory
    else
      tie_game
    end
  end

  def whose_turn?
    player = if (@current_player % 2).eql?(0)
              @player2
             else
              @player1
             end

    column_selection = player.place_game_piece(@columns) - 1
    add_game_piece(player, column_selection)
  end

  def add_game_piece(player, column)
    i = 0
    while @board[column][i] != ' '
      i += 1
    end
    @board[column][i] = player.game_piece
    @columns.delete(column + 1) if i == 5
  end

end
