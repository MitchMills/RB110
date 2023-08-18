# Dealer Turn
# loop do
#   if dealer_hand_value >= 17
#     'stay'
#   else
#    'hit'
#   end
# end

# def determine_winner
#   foo = 0
# end

# def display_result
#   faf = 2
# end

deck = [
  ["2", "Clubs"], ["2", "Diamonds"], ["2", "Hearts"], ["2", "Spades"],
  ["3", "Clubs"], ["3", "Diamonds"], ["3", "Hearts"], ["3", "Spades"],
  ["4", "Clubs"], ["4", "Diamonds"], ["4", "Hearts"], ["4", "Spades"],
  ["5", "Clubs"], ["5", "Diamonds"], ["5", "Hearts"], ["5", "Spades"],
  ["6", "Clubs"], ["6", "Diamonds"], ["6", "Hearts"], ["6", "Spades"],
  ["7", "Clubs"], ["7", "Diamonds"], ["7", "Hearts"], ["7", "Spades"],
  ["8", "Clubs"], ["8", "Diamonds"], ["8", "Hearts"], ["8", "Spades"],
  ["9", "Clubs"], ["9", "Diamonds"], ["9", "Hearts"], ["9", "Spades"],
  ["10", "Clubs"], ["10", "Diamonds"], ["10", "Hearts"], ["10", "Spades"],
  ["Jack", "Clubs"], ["Jack", "Diamonds"], ["Jack", "Hearts"], ["Jack", "Spades"],
  ["Queen", "Clubs"], ["Queen", "Diamonds"], ["Queen", "Hearts"], ["Queen", "Spades"],
  ["King", "Clubs"], ["King", "Diamonds"], ["King", "Hearts"], ["King", "Spades"],
  ["Ace", "Clubs"], ["Ace", "Diamonds"], ["Ace", "Hearts"], ["Ace", "Spades"]
]

hands = { player: [["2", "Hearts"], ["8", "Diamonds"]], dealer: [["2", "Clubs"], ["Ace", "Spades"]] }

def prompt(message)
  puts "=> #{message}"
end

def deal_card(deck, hand)
  card = deck.sample
  deck.delete(card)
  hand << card
end


def card_names(hand)
  hand.map do |card|
    "#{card[0]} of #{card[1]}"
  end
end

def display_both_hands(hands, context)
  display_hand(hands[:dealer], :dealer, context)  
  display_hand(hands[:player], :player, :all_cards)
end

def display_hand(hand, owner, context)
  display_hand_header(owner, context)
  start_index = (context == :hidden_card ? 1 : 0)
  card_names(hand).each_with_index do |card, idx|
    prompt(" #{card}") if idx >= start_index
  end
  display_total(hand, context)
  puts
end

def display_hand_header(owner, context)
  label = (owner == :player) ? "Your hand:" : "Dealer hand:"
  prompt(label)
  prompt(" Facedown Card") if context == :hidden_card
end

def display_total(hand, context)
  label = (context == :hidden_card) ? "Visible card value: " : "Card value: "
  prompt(label + "#{total(hand, context)}")
end

def total(hand, context)
  face_values = hand.map { |card| card[0] }
  sum = 0
  start_index = (context == :hidden_card) ? 1 : 0
  sum = initial_sum(face_values, start_index, sum)
  sum = correct_for_aces(face_values, sum)
end

def initial_sum(face_values, start_index, sum)
  face_values.each_with_index do |value, idx|
    if idx >= start_index
      sum = sum_cards(sum, value)
    end
  end
  sum
end

def sum_cards(sum, value)
  if value == "Ace"
    sum += 11
  elsif value.to_i == 0
    sum += 10
  else
    sum += value.to_i
  end
end

def correct_for_aces(face_values, sum)
  face_values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted?(hand)
  total(hand, :all_cards) > 21
end

def player_turn(deck, hands)
  loop do
    answer = hit_or_stay(hands)
    hit(deck, hands, :player) if answer == "hit"
    break if busted?(hands[:player]) || answer == "stay"    
  end
  if busted?(hands[:player])
    display_both_hands(hands, :all_cards)
    prompt("Busted!")
  else
    prompt("You chose to stay.")
  end
end

def hit_or_stay(hands)
  answer = nil
  loop do
    display_both_hands(hands, :hidden_card)
    prompt("Would you like to hit or stay?")
    answer = gets.chomp.downcase
    break if ["hit", "stay"].include?(answer)
    system 'clear'
    prompt("Sorry, that's not a valid response. Please try again.")
    puts
  end
  answer
end

def hit(deck, hands, owner)
  system 'clear'
  deal_card(deck, hands[owner])
  prelude = (owner == :player) ? "You get " : "The dealer gets "
  prompt(prelude + "the #{card_names(hands[owner]).last}.")
  puts
end

def dealer_turn(deck, hands)
  loop do
    break if total(hands[:dealer], :all_cards) >= 17
    hit(deck, hands, :dealer)
    display_both_hands(hands, :hidden_card)
    gets
  end
  if busted?(hands[:dealer])
    display_both_hands(hands, :all_cards)
    prompt("Busted!")
  else
    prompt("The dealer has chosen to stay.")
  end
end

dealer_turn(deck, hands)
display_both_hands(hands, :all_cards)
