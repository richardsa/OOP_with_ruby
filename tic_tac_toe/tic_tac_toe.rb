class Game
  attr_accessor :game_board, :game_over, :player
  @game_over = false
  @@player = 0
  @@turns = 0
  def initialize
    @game_board = game_board
  end
   
  def game_board
    @game_board = (1..9).to_a
  end
   
  def print_game_board
    i = 0
    3.times do
      x = 0
      print "|"
      while x < 3
        print "#{@game_board[i]}|"
        x += 1
        i += 1
    end
    print "\n"
    end
  end
   
  def moves
    puts "Enter the number of the square you would like to play:"
    move = gets.chomp.to_i
     
    legal = false
     
    until legal == true
      if ((@game_board[move-1] == 'O') || (@game_board[move-1] == 'X'))
        puts "Try again - that square is taken"
        move = gets.chomp.to_i
      elsif (move > 9 || move < 1)
        puts "Not a valid square. Try again:"
        move = gets.chomp.to_i
      else
        legal = true
      end
    end
      
    if (@@player % 2 == 0)
        @game_board[move-1] = "X"
    else
        @game_board[move-1] = "O"
    end
     
  end
   
  def game_play
    until @game_over
      moves
      print_game_board
      @@player += 1
      @@turns += 1
      winner
    end
  end
   
  def winner
    if ((@game_board[0] == "O" && @game_board[1] == "O" && @game_board[2] == "O") ||
        (@game_board[3] == "O" && @game_board[4] == "O" && @game_board[5] == "O") ||
        (@game_board[6] == "O" && @game_board[7] == "O" && @game_board[8] == "O") ||
        (@game_board[0] == "O" && @game_board[4] == "O" && @game_board[8] == "O") ||
        (@game_board[2] == "O" && @game_board[4] == "O" && @game_board[6] == "O") ||
        (@game_board[0] == "O" && @game_board[3] == "O" && @game_board[6] == "O") ||
        (@game_board[1] == "O" && @game_board[4] == "O" && @game_board[7] == "O") ||
        (@game_board[2] == "O" && @game_board[5] == "O" && @game_board[8] == "O"))
      puts "player 2 is the winner"
      @game_over = true
    elsif ((@game_board[0] == "X" && @game_board[1] == "X" && @game_board[2] == "X") ||
          (@game_board[3] == "X" && @game_board[4] == "X" && @game_board[5] == "X") ||
          (@game_board[6] == "X" && @game_board[7] == "X" && @game_board[8] == "X") ||
          (@game_board[0] == "X" && @game_board[4] == "X" && @game_board[8] == "X") ||
          (@game_board[2] == "X" && @game_board[4] == "X" && @game_board[6] == "X") ||
          (@game_board[0] == "X" && @game_board[3] == "X" && @game_board[6] == "X") ||
          (@game_board[1] == "X" && @game_board[4] == "X" && @game_board[7] == "X") ||
          (@game_board[2] == "X" && @game_board[5] == "X" && @game_board[8] == "X"))
      puts "player 2 is the winner"
      @game_over = true
    elsif @@turns == 9
        puts "Game over. No more remaining moves. No winner this time!"
        @game_over = true
    else
      @game_over = false
    end
  end
    
end