SUITS = %w(Clubs Diamonds Hearts Spades)
FACE_VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)

CARDS_IN_ONE_DECK = SUITS.size * FACE_VALUES.size
DECKS_IN_GAME = 1
CARDS_IN_GAME = CARDS_IN_ONE_DECK * DECKS_IN_GAME
RESHUFFLE_TRIGGER = 0.25

DEALER_STAY_TOTAL = 17
TARGET_TOTAL = 21
CARDS_IN_FIRST_DEAL = 2

ROLES = [:player, :dealer]

# general methods
def prompt(message, action = :puts)
  action == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line(number = 1)
  number.times { puts }
end

# game setup methods
def intro
  system('clear')
  prompt("Welcome to Twenty One!")
  prompt("You will play against the dealer.")
  prompt("Enter any key to deal the first hand: ", :print)
  gets
end

def initialize_game_data
  ROLES.each_with_object({}) { |role, game_data| game_data[role] = {} }
end

def round_set_up(deck, game_data)
  system('clear')
  deck = reshuffle_deck if time_to_reshuffle?(deck)
  deal_starting_hands(deck, game_data)

  narrate_starting_deal(game_data)
  blank_line
  display_both_hands(game_data, :visible_cards)
end

def outro
  prompt("Thank you for playing Twenty One!")
end

# deck / dealing methods
def initialize_deck
  one_deck = FACE_VALUES.each_with_object([]) do |value, deck|
    SUITS.each { |suit| deck << "#{value} of #{suit}" }
  end
  (one_deck * DECKS_IN_GAME).shuffle
end

def reshuffle_deck
  prompt('The dealer reshuffled the deck.')
  initialize_deck
end

def time_to_reshuffle?(deck)
  deck.size < (CARDS_IN_GAME * RESHUFFLE_TRIGGER) + rand(CARDS_IN_GAME / 5)
end

def deal_starting_hands(deck, game_data)
  initialize_hands(game_data)
  CARDS_IN_FIRST_DEAL.times { deal_card_to_all_players(deck, game_data) }
  card_totals(game_data)
end

def initialize_hands(game_data)
  ROLES.each { |role| game_data[role][:hand] = { cards: [] } }
end

def deal_card_to_all_players(deck, game_data)
  ROLES.each { |role| deal_one_card(game_data[role][:hand][:cards], deck) }
end

def deal_one_card(hand, deck)
  hand << deck.shift
end

def hit(game_data, role, deck)
  deal_one_card(game_data[role][:hand][:cards], deck)
  narrate_dealt_card(role, game_data[:hands][role].last)
  blank_line
  sleep(0.1)
end

def narrate_starting_deal(game_data)
  hands = ROLES.map { |role| game_data[role]][:hand][:cards] }
  cards = hands[0].zip(hand[1]).flatten
  cards[3] = 'face-down card'
  prompt("Here's the deal:")
  sleep(0.8)
  cards.each_with_index do |card, index|
    role = index.even? ? :player : :dealer
    narrate_dealt_card(role, card)
  end
end

def narrate_dealt_card(role, card)
  prelude = role == :player ? ' You get' : '   The dealer gets'
  article = card == 'face-down card' ? 'a' : 'the'
  prompt("#{prelude} #{article} #{card}")
  sleep(0.8)
end

# scoring methods
def card_totals(game_data)
  ROLES.each do |role|
    hand = game_data[role][:hand]
    hand[:total] = total(hand[:cards])
  end

  dealer_hand = game_data[:dealer][:hand]
  dealer_hand[:visible_total] = total(dealer_hand[:cards], :visible_cards)
end

def total(hand, context = :all_cards)
  hand -= [hand[1]] unless context == :all_cards
  raw_total = raw_total(hand)
  adjust_for_aces(hand, raw_total)
end

def raw_total(hand)
  values = hand.map { |card| card.split.first }
  values.map do |value|
    value.to_i > 0 ? value.to_i : face_card_value(value)
  end.sum
end

def face_card_value(value)
  %w(Jack Queen King).include?(value) ? 10 : 11
end

def adjust_for_aces(hand, total)
  number_of_aces = hand.map { |card| card.split.first }.count('Ace')
  number_of_aces.times { total -= 10 if total > TARGET_TOTAL }
  total
end

def busted?(total)
  total > TARGET_TOTAL
end

def dealer_stay?(game_data)
  dealer_total = game_data[:dealer][:hand][:total]
  player_total = game_data[:player][:hand][:total]
  dealer_total >= DEALER_STAY || dealer_total > player_total
end

# hand display methods
def display_both_hands(game_data, context = :all_cards)
  game_data[:hands].keys.each do |role|
    display_one_hand(game_data, role, context)
    sleep(0.1)
  end
end

def display_one_hand(game_data, role, context)
  display_hand_title(role)
  display_hand_cards(game_data, role, context)
  display_hand_total(game_data, role, context)
  blank_line
end

def display_hand_title(role)
  title = role == :player ? "YOUR" : "DEALER'S"
  puts "#{title} HAND:"
end

def display_hand_cards(game_data, role, context)
  hand = game_data[:hands][role]
  hand = visible_hand(hand) if role == :dealer && context == :visible_cards
  hand.each { |card| puts " #{card}" }
end

def visible_hand(hand)
  hand.map.with_index { |card, index| index == 1 ? 'Face-down card' : card }
end

def display_hand_total(game_data, role, context)
  label = 'Card Value:'
  label.prepend('Visible ') if role == :dealer && context == :visible_cards
  context = :all_cards if role == :player
  total = total(game_data[:hands][role], context)
  puts "#{label} #{total}"
end

# player turn methods
def player_turn(game_data)
  loop do
    choice = hit_or_stay
    break if choice == 's'
    hit(game_data, :player)
    display_both_hands(game_data, :visible_cards)
    break if busted?(game_data[:player][:hand][:total])
  end
end

def hit_or_stay
  choice = player_choice
  sleep(0.4)
  system('clear')
  display_choice(choice)
  choice
end

def player_choice
  prompt("Would you like to hit, or stay?")
  loop do
    prompt("Enter 'h' to hit, or 's' to stay: ", :print)
    choice = gets.chomp
    return choice if %w(h s).include?(choice.downcase)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
end

def display_choice(choice)
  action = choice == 'h' ? 'hit' : 'stay'
  prompt("You chose to #{action}.")
  sleep(0.6)
end

# dealer turn methods
def dealer_turn(game_data)
  dealer_turn_intro(game_data)
  loop do
    hand = game_data[:hands][:dealer]
    continue_dealer_turn unless busted?(game_data[:dealer][:hand][:total])
    break if busted?(game_data[:dealer][:hand][:total]) ||
      dealer_stay?(game_data)
    dealer_hits(game_data)
    display_both_hands(game_data)
    sleep(1)
  end
  dealer_turn_outro(game_data)
end

def dealer_turn_intro(game_data)
  blank_line
  prompt("Now it's the dealer's turn.")
  sleep(0.8)
  prompt('The dealer reveals their face-down card:')
  sleep(0.8)
  blank_line
  display_both_hands(game_data)
end

def continue_dealer_turn
  prompt("Enter any key to continue with the dealer's turn: ", :print)
  gets
  system('clear')
end

def dealer_hits(game_data)
  prompt('The dealer hits.')
  sleep(0.8)
  hit(game_data, :dealer)
end

def dealer_turn_outro(game_data)
  system('clear')
  prompt('The dealer stays.') unless busted?(game_data[:dealer][:hand][:total])
  blank_line
  display_both_hands(game_data)
end

# round methods
def round_result(game_data)
  display_win_reason(game_data)
  display_winner(game_data)
end

def display_win_reason(game_data)
  hands = game_data[:hands]
  winner = determine_winner(game_data)
  if !!busted_winner(hands)
    buster = busted_winner(hands) == :dealer ? 'You' : 'The dealer'
    prompt("#{buster} busted.")
  elsif [:player, :dealer].include?(winner)
    winner = winner == :player ? 'You have' : 'The dealer has'
    prompt("#{winner} a higher hand.")
  else
    prompt("Your hands are equal.")
  end
end

def determine_winner(game_data)
  hands = game_data[:hands]
  busted_winner(hands) || value_winner(hands)
end

def busted_winner(hands)
  roles = ROLES
  roles.each_with_index do |role, index|
    return roles[1 - index] if busted?(game_data[role][:hand][:total])
  end
  nil
end

def value_winner(hands)
  difference = total(hands[:player]) - total(hands[:dealer])
  case difference
  when 0 then :tie
  when (0..) then :player
  else :dealer
  end
end

def display_winner(game_data)
  winner = determine_winner(game_data)
  if [:player, :dealer].include?(winner)
    role = winner == :player ? 'You' : 'The dealer'
    prompt("#{role} won!")
  else
    prompt("It's a tie.")
  end
end

def another_round?
  blank_line
  prompt("Enter 'y' to play another game. Enter any other key to stop playing.")
  gets.chomp.downcase == 'y'
end

# main game loop
# intro
# game_data = initialize_game_data
# deck = initialize_deck
# loop do
#   round_set_up(game_data)
#   player_turn(game_data)
#   dealer_turn(game_data) unless busted?(game_data[:player][:hand][:total])
#   round_result(game_data)
#   p game_data[:deck].size
#   break unless another_round?
# end
# outro

# testing
game_data = initialize_game_data
p game_data
deck = initialize_deck

p deck.size
deal_starting_hands(deck, game_data)
p game_data
p deck.size
