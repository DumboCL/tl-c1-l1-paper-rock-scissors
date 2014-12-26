# rock_paper_scissors.rb
#
# Tealeaf Course 1 -- Lesson 1 Assignment
# 24/12/2014

require 'pry'

GAME_OPTIONS = ['P', 'R', 'S']

# printout a message to console
def say(msg)
  puts "#{msg}"
end

# the data validation method
def data_validation(options = ['Y', 'N'], choose)
  choose = choose.upcase
  options.include?(choose)
end

# return if user wanna continue
def continue_next(choose)
  choose = choose.upcase
  choose == 'Y'
end

# Hand Signal Name
def signal_name(signal)
  case signal
  when 'P'
    name = 'Paper'
  when 'R'
    name = 'Rock'
  when 'S'
    name = 'Scissors'   
  end 
end

# the game logic
def you_win(your_pick,computer_pick)
  
  if your_pick == 'P'
    if computer_pick == 'R'
      you_win = true
    else
      you_win = false
    end
  elsif your_pick == 'R'
    if computer_pick == 'S'
      you_win = true
    else
      you_win = false
    end
  elsif your_pick == 'S'
    if computer_pick == 'P'
      you_win = true
    else
      you_win = false
    end      
  end
end

# the game method
def game_execute(your_pick)
  your_pick = your_pick.upcase

  prng = Random.new

  computer_pick = GAME_OPTIONS[prng.rand(0..2)]

  your_pick_name = signal_name(your_pick)
  computer_pick_name = signal_name(computer_pick)

  say "You picked #{your_pick_name} and computer picked #{computer_pick_name}."
  
  if your_pick == computer_pick
    say "It's a tie."

  elsif you_win(your_pick,computer_pick)
    say "#{your_pick_name} wraps #{computer_pick_name}!"
    say "You won!"
  else
    say "#{computer_pick_name} wraps #{your_pick_name}!"
    say "Computer won!"
  end
end


# main process
say "Play Paper Rock Scissors!"

begin
  # begin choose

  # validate input
  begin 
    say "Choose one: (P/R/S)"
    your_choose = gets.chomp
  end while !data_validation(options = GAME_OPTIONS, choose = your_choose)

  # game process
  game_execute(your_choose)

  # validate input
  begin 
    say "Play again? (Y/N)"
    ifcontinue = gets.chomp
  end while !data_validation(choose = ifcontinue)

end while continue_next(ifcontinue)
