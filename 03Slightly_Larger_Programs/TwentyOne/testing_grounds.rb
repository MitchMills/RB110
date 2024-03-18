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
  number = CARDS_IN_GAME * RESHUFFLE_TRIGGER
  deck.size < (number + rand(number))
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

def hit(role, deck, game_data)
  hand = game_data[role][:hand]
  deal_one_card(hand[:cards], deck)
  narrate_dealt_card(role, hand[:cards].last)
  hand[:total] = total(hand[:cards])
  hand[:visible_total] = total(hand[:cards], :visible_cards) if role == :dealer
  blank_line
  sleep(0.1)
end

def narrate_starting_deal(game_data)
  hands = ROLES.map { |role| game_data[role][:hand][:cards] }
  cards = hands[0].zip(hands[1]).flatten
  cards[3] = 'face-down card'
  prompt("Here's the deal:")
  sleep(0.7)
  cards.each_with_index do |card, index|
    role = index.even? ? :player : :dealer
    narrate_dealt_card(role, card)
  end
end

def narrate_dealt_card(role, card)
  prelude = role == :player ? ' You get' : '   The dealer gets'
  article = card == 'face-down card' ? 'a' : 'the'
  prompt("#{prelude} #{article} #{card}")
  sleep(0.7)
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
  dealer_total >= DEALER_STAY_TOTAL || dealer_total > player_total
end

# hand display methods
def display_both_hands(game_data, context = :all_cards)
  ROLES.each do |role|
    display_one_hand(role, context, game_data)
    sleep(0.1)
  end
end

def display_one_hand(role, context, game_data)
  display_hand_title(role)
  display_hand_cards(role, context, game_data)
  display_hand_total(role, context, game_data)
  blank_line
end

def display_hand_title(role)
  title = role == :player ? "YOUR" : "DEALER'S"
  puts "#{title} HAND:"
end

def display_hand_cards(role, context, game_data)
  cards = game_data[role][:hand][:cards]
  cards = visible_hand(cards) if role == :dealer && context == :visible_cards
  cards.each { |card| puts " #{card}" }
end

def visible_hand(cards)
  cards.map.with_index { |card, index| index == 1 ? 'Face-down card' : card }
end

def display_hand_total(role, context, game_data)
  context = :all_cards if role == :player
  label = hand_total_label(context)
  hand = game_data[role][:hand]
  total = context == :all_cards ? hand[:total] : hand[:visible_total]
  puts "#{label} #{total}"
end

def hand_total_label(context)
  context == :visible_cards ? 'Visible Card Value:' : 'Card Value:'
end

# player turn methods
def player_turn(deck, game_data)
  loop do
    choice = hit_or_stay
    break if choice == 's'
    hit(:player, deck, game_data)
    display_both_hands(game_data, :visible_cards)
    break if busted?(game_data[:player][:hand][:total])
  end
end

def hit_or_stay
  choice = player_choice
  sleep(0.3)
  system('clear')
  display_choice(choice)
  choice
end

def player_choice
  prompt("Would you like to hit, or stay?")
  loop do
    prompt("Enter 'h' to hit, or 's' to stay: ", :print)
    choice = gets.chomp.downcase
    return choice if %w(h s).include?(choice)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
end

def display_choice(choice)
  action = choice == 'h' ? 'hit' : 'stay'
  prompt("You chose to #{action}.")
  sleep(0.5)
end

# dealer turn methods
def dealer_turn(deck, game_data)
  dealer_turn_intro(game_data)
  loop do
    total = game_data[:dealer][:hand][:total]
    continue_dealer_turn unless busted?(total)
    break if busted?(total) || dealer_stay?(game_data)
    dealer_hits(deck, game_data)
    display_both_hands(game_data)
    sleep(0.7)
  end
  dealer_turn_outro(game_data)
end

def dealer_turn_intro(game_data)
  blank_line
  prompt("Now it's the dealer's turn.")
  sleep(0.7)
  prompt('The dealer reveals their face-down card:')
  sleep(0.7)
  blank_line
  display_both_hands(game_data)
end

def continue_dealer_turn
  prompt("Enter any key to continue with the dealer's turn: ", :print)
  gets
  system('clear')
end

def dealer_hits(deck, game_data)
  prompt('The dealer hits.')
  sleep(0.7)
  hit(:dealer, deck, game_data)
end

def dealer_turn_outro(game_data)
  system('clear')
  prompt('The dealer stays.') unless busted?(game_data[:dealer][:hand][:total])
  blank_line
  display_both_hands(game_data)
end

# round methods
def round_result(game_data)
  winner = determine_winner(game_data)
  display_win_reason(winner, game_data)
  display_winner(winner, game_data)
end

def determine_winner(game_data)
  busted_winner(game_data) || hand_winner(game_data)
end

def busted_winner(game_data)
  roles = ROLES
  roles.each_with_index do |role, index|
    return roles[1 - index] if busted?(game_data[role][:hand][:total])
  end
  nil
end

def hand_winner(game_data)
  difference = ROLES.map { |role| game_data[role][:hand][:total] }.inject(:-)
  case difference
  when 0 then :tie
  when (0..) then :player
  else :dealer
  end
end

def display_win_reason(winner, game_data)
  if !!busted_winner(game_data)
    buster = busted_winner(game_data) == :dealer ? 'You' : 'The dealer'
    prompt("#{buster} busted.")
  elsif ROLES.include?(winner)
    winner_and_verb = winner == :player ? 'You have' : 'The dealer has'
    prompt("#{winner_and_verb} a higher hand.")
  else
    prompt("Your hands are equal.")
  end
end

def display_winner(winner, game_data)
  if ROLES.include?(winner)
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
intro
game_data = initialize_game_data
deck = initialize_deck
loop do
  deck = reshuffle_deck if time_to_reshuffle?(deck)
  round_set_up(deck, game_data)
  player_turn(deck, game_data)
  dealer_turn(deck, game_data) unless busted?(game_data[:player][:hand][:total])
  round_result(game_data)
  break unless another_round?
end
outro
