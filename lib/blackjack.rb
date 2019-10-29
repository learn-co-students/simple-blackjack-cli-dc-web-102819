def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(11)+1
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(final_total)
  puts "Sorry, you hit #{final_total}. Thanks for playing!"
end

def initial_round
  opening_deal = deal_card + deal_card
  display_card_total(opening_deal)
  opening_deal
end

def hit?(current_total)
  prompt_user
  action = get_user_input
  
  until action == "s" || action == "h"
    invalid_command
    prompt_user
    action = get_user_input
  end
  
  if action == "h"
    current_total += deal_card
    # display_card_total(current_total)
  end
  current_total
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  hand = initial_round
  until hand >= 21
    hand = hit?(hand)
    display_card_total(hand)
  end
  end_game(hand)
end
    
