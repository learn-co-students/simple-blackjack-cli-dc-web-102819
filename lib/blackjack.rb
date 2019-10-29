def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  dealt_card = rand(1..11)
  dealt_card
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(score)
  if score > 21
    puts "Sorry, you hit #{score}. Thanks for playing!"
  elsif score < 22
    prompt_user
  else
    puts "Sorry, I didn't get that."
  end
end

def initial_round
  first_card = deal_card
  second_card = deal_card
  initial_score = first_card + second_card
  display_card_total(initial_score)
  initial_score
end

def hit?(score)
  prompt_user
  response = get_user_input
  if response == "s"
    score
  elsif response == "h"
    score += deal_card
    score
  else
    invalid_command
    hit?(score)
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  running_score = initial_round
  while running_score <= 21
    running_score = hit?(running_score)
    display_card_total(running_score)
  end
  end_game(running_score)
end