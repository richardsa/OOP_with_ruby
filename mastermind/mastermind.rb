class Mastermind
  attr_accessor :solution, :guess, :turns_left, :winner, :correct_pos, :correct_num, :game_mode
  
  #initialize variables
  def initialize
    @solution = (1..6).to_a.shuffle
    @turns_left = 10
    @winner = false
  end
  
  #loops through game 10 times or until correct answer given
  def game
    game_mode   
    set_solution
    until (@turns_left < 1 || @winner)
      guess
      checker
      @turns_left -= 1
      status
    end
  end
  
  #let's user decide if they would like to guess or if the computer should guess
  def game_mode
    puts "Welcome to my version of Mastermind!"
    puts "You must try to guess the computer's 4 digit combination."
    puts "The 4 digit combination consists of 4 number between 1 and 6."
    puts "The number's do not repeat."
    puts "You have 10 tries!"
    puts "Can you succeed?"
    puts "But if you are feeling brave, you can challenge the computer to guess your combination."
    puts "Enter 1 if you would like to guess or enter 2 if you would like for the computer to guess:"
    @game_mode = gets.chomp.to_i
    valid = false
    until valid
	  if (@game_mode> 2 || @game_mode < 1)
		puts "Invalid game mode.  Try again:"
		@game_mode = gets.chomp.to_i
      else
		valid = true
	  end
	end
  end
	
  #allows user or computer to set solution depending on game mode
  def set_solution
    if @game_mode == 1
      @solution = @solution[0..3]
    else
      @solution = []
      puts "Very Brave of you!"
      puts "Enter your combination.  Don't worry the computer isn't looking."
      4.times do |i|
        valid = false
        puts "Enter position #{i + 1} "
        position = gets.chomp.to_i
        until valid
          if @solution.include?(position)
            puts "You already entered that number.  Try again:"
            position = gets.chomp.to_i
          elsif ((position > 6)  || (position < 0))
            puts "Enter a valid number:"
            position = gets.chomp.to_i
          else
            @solution << position
            valid = true
          end
        end  
      end
    
    end
  end
     
  # retrieves guesses from user
  def guess
    @guess = []
    i = 1
    
    if @game_mode == 1
	  puts "Enter your moves."
	  4.times do |i|
	    puts "Position #{i + 1}:"
		position = gets.chomp.to_i
		valid = false
		until valid
		  if @guess.include?(position)
			puts "You already guessed that number.  Try again:"
			position = gets.chomp.to_i
		  elsif ((position > 6)  || (position < 0))
			puts "Enter a valid number:"
			position = gets.chomp.to_i
		  else
			@guess << position
			valid = true
		  end
		end     
	  end
	else
	  4.times do
		position = rand(1..6)
		@guess << position 
	  end
	end
   
  end
  
  #checks user guess against solution
  def checker
    @correct_pos = 0
    @correct_num = 0
    x = 0
    @guess.each do |i|
      if (i == @solution[x])
        @correct_pos += 1
      elsif @solution.include?(i)
        @correct_num += 1
      end
      x += 1
    end
  end
  
  #checks and returns status of player, including number of guesses remaining, number correct and if winner or loser
  def status
    if @game_mode == 2
	  if @correct_pos == 4
		@winner = true
		puts "The computer guessed correctly!  You lose!"
	  else
		puts "The computer's guess: #{@guess}"
		puts "Number in correct position: #{@correct_pos}"
		puts "Correct number, but wrong position: #{@correct_num}"
	  	
        if @turns_left > 1
		  puts "The computer has #{@turns_left} turns remaining."
          puts ""
		elsif @turns_left == 1
		  puts "The computer has #{@turns_left} turn remaining."
          puts ""
		elsif @turns_left == 0
		  puts "GAME OVER!"
		  puts "YOU WIN!"
			
		end
	  end
	else
	  if @correct_pos == 4
		@winner = true
		puts "YOU WIN! CONGRATULATIONS!"
	  else
		puts "Your guess: #{@guess}"
		puts "Number in correct position: #{@correct_pos}"
		puts "Correct number, but wrong position: #{@correct_num}"
		if @turns_left > 1
		  puts "You have #{@turns_left} turns remaining."
		elsif @turns_left == 1
		  puts "You have #{@turns_left} turn remaining."
		elsif @turns_left == 0
		  puts "GAME OVER!"
		  puts "The correct answer was: #{@solution}"
		end
	  end
	end
  end
  
end

