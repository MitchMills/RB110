SUITS = %w(Clubs Diamonds Hearts Spades)
FACE_VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)

DEALER_STAY = 17
BLACKJACK = 21

# general methods
def prompt(message, action = :puts)
  action == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line(number = 1)
  number.times { puts }
end

# game setup methods
def game_set_up(game_data)
  system('clear')
  initialize_deck(game_data)
  deal_starting_hands(game_data)
  display_starting_deal(game_data)
  blank_line
  display_both_hands(game_data)
end

def game_intro
  system('clear')
  sleep(0.6)
  prompt("Welcome to Twenty One!")
  sleep(0.8)
  prompt("You will play against the dealer.")
  sleep(0.8)
  prompt("Enter any key to deal the first hand: ", :print)
  gets
  sleep(0.8)
  system('clear')
end

# deck methods
def initialize_deck(game_data, number = 1)
  one_deck = FACE_VALUES.each_with_object([]) do |value, deck|
    SUITS.each { |suit| deck << "#{value} of #{suit}" }
  end
  game_data[:deck] = (one_deck * number).shuffle
end

def deal_starting_hands(game_data)
  initialize_hands(game_data)
  2.times do
    [:player, :dealer].each { |person| deal_one_card(game_data, person) }
  end
end

def initialize_hands(game_data)
  game_data[:hands] = { player: [], dealer: [] }
end

def deal_one_card(game_data, person)
  card = game_data[:deck].shift
  game_data[:hands][person] << card
end

# score methods
def hand_score(hand, context = :all_cards)
  hand -= [hand[1]] unless context == :all_cards
  raw_score = get_raw_score(hand)
  adjust_score(hand, raw_score)
end

def get_raw_score(hand)
  values = hand.map { |card| card.split.first }
  values.map do |value|
    value.to_i > 0 ? value.to_i : face_card_value(value)
  end.sum
end

def face_card_value(value)
  %w(Jack Queen King).include?(value) ? 10 : 11
end

def adjust_score(hand, score)
  number_of_aces = hand.map { |card| card.split.first }.count('Ace')
  number_of_aces.times { score -= 10 if score > BLACKJACK }
  score
end

# hand display methods
def display_both_hands(game_data)
  game_data[:hands].keys.each { |person| display_hand_info(game_data, person) }
end

def display_hand_info(game_data, person)
  title = person == :player ? "YOUR" : "DEALER'S"
  puts "#{title} HAND:"
  display_cards(game_data, person)
  display_score(game_data, person)
  blank_line
end

def display_cards(game_data, person)
  hand = game_data[:hands][person]
  hand[1] = "Face-down Card" if person == :dealer
  hand.each { |card| puts " #{card}" }
end

def display_score(game_data, person)
  hand = game_data[:hands][person]
  score = person == :player ? hand_score(hand) : hand_score(hand, :visible)
  label = person == :player ? "Card Value:" : "Visible Card Value:"
  puts "#{label} #{score}"
end

def display_starting_deal(game_data)
  hands = game_data[:hands]
  hands[:dealer][1] = 'face-down card'
  cards = hands[:player].zip(hands[:dealer]).flatten

  prompt("Here's the deal:")
  sleep(0.8)
  cards.each_with_index do |card, index|
    person = index.even? ? :player : :dealer
    display_dealt_card(person, card)
  end
end

def display_dealt_card(person, card)
  prelude = person == :player ? ' You get' : '   The dealer gets'
  article = card == 'face-down card' ? 'a' : 'the'
  prompt("#{prelude} #{article} #{card}")
  sleep(0.8)
end

# player turn methods
def player_turn(game_data)
  loop do
    choice = hit_or_stay
    break if choice == 's'
    hit(game_data, :player)
    display_both_hands(game_data)
    break prompt("BUSTED!") if busted?(game_data[:hands][:player])
  end
  stay(game_data)
end

def hit_or_stay
  choice = player_choice
  sleep(0.4)
  system('clear')
  display_choice(choice)
  choice
end

def player_choice
  blank_line
  prompt("Would you like to hit, or stay?")
  loop do
    prompt("Enter 'h' to hit, or 's' to stay: ", :print)
    choice = gets.chomp
    return choice if %w(h s).include?(choice)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
end

def display_choice(choice)
  action = choice == 'h' ? 'hit' : 'stay'
  prompt("You chose to #{action}.")
  sleep(0.6)
end

def hit(game_data, person)
  deal_one_card(game_data, person)
  display_dealt_card(person, game_data[:hands][person].last)
  sleep(0.4)
  blank_line
end

def busted?(hand)
  hand_score(hand) > BLACKJACK
end

def stay(game_data)
  blank_line
  display_both_hands(game_data)
end

# computer turn methods

# main game loop
game_intro
loop do
  game_data = {}
  game_set_up(game_data)
  player_turn(game_data)
  break
end

# tests

# OUTLINE
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
#
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
