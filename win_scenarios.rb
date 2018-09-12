module WinScenarios

  def check_win_status
    if horizontal_win? || vertical_win? || diagonal_win?
      return true
    else
      false
    end
  end

  def diagonal_win?
    (0..3).each do |j|
      (0..2).each do |i|
        if @board[j][i] != ' ' && @board[j][i] == @board[j + 1][i + 1] &&
          @board[j + 1][i + 1] == @board[j + 2][i + 2] &&
          @board[j + 2][i + 2] == @board[j + 3][i + 3]
          return true
        end
      end

      (3..5).each do |i|
        return true if @board[j][i] != ' ' && @board[j][i] == @board[j + 1][i - 1] && @board[j + 1][i - 1] == @board[j + 2][i - 2] && @board[j + 2][i - 2] == @board[j + 3][i - 3]
      end
    end
    false
  end

  def horizontal_win?
    (0..5).each do |i|
      (0..3).each do |j|
        if @board[j][i] != ' ' && @board[j][i] == @board[j + 1][i] &&
          @board[j + 1][i] == @board[j + 2][i] && board[j + 2][i] == board[j + 3][j]
          return true
        end
      end
    end
    false
  end

  def vertical_win?
    (0..6).each do |j|
      (0..2).each do |i|
        if @board[j][i] != ' ' && @board[j][i] == @board[j][i + 1] &&
          @board[j][i + 1] == @board[j][i + 2] && @board[j][i + 2] == @board[j][i + 3]
          return true
        end
      end
    end
    false
  end

  def victory
    victor = if (@current_player % 2).eql?(0)
          @player1.name
         else
          @player2.name
         end
    puts
    puts "CONNECT4!\n\nYou are victorious #{victor}!"
  end

  def tie_game
    puts "\nTie game. What a battle!"
  end
end
