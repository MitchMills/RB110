SUITS = %w(Clubs Diamonds Hearts Spades)
FACE_VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)
ONE_DECK = FACE_VALUES.each_with_object([]) do |value, deck|
  SUITS.each { |suit| deck << "#{value} of #{suit}" }
end

BLACKJACK = 21
BUSTED = 22


# general methods
def prompt(message, action = :puts)
  action == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line(number = 1)
  number.times { puts }
end


# deck methods
def initialize_deck(game_data, number = 1)
  game_data[:deck] = (ONE_DECK * number).shuffle
end

def initialize_hands(game_data)
  game_data[:hands] = { player: [], dealer: [] }
end

def deal_one_card(deck, person)
  person << deck.shift
end

def deal_starting_hands(deck, hands)
  2.times do
    [:player, :dealer].each { |person| deal_one_card(deck, hands[person]) }
  end
end


# score methods
def hand_score(hand)
  raw_score = get_raw_score(hand)
  adjust_score(hand, raw_score)
end

def visible_score(hand)
  hand -= [hand[1]]
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
  number_of_aces.times { score -= 10 if score > 21 }
  score
end


# hand display methods
def display_both_hands(game_data)
  game_data[:hands].keys.each { |person| display_hand(game_data, person) }
end

def display_hand_info(game_data, person)
  title = person = :player ? "YOUR" : "DEALER'S"
  puts "#{title} HAND:"
  display_hand(game_data, person)
  display_score(game_data, person)
  blank_line
end

def display_hand(game_data, person)
  hand = game_data[:hands][person]
  hand[1] = "Face-down Card" if person == :dealer
  hand.each { |card| puts "  #{card}" }
end

def display_score(game_data, person)
  hand = game_data[:hands][person]
  score = person == :player ? hand_score(hand) : visible_score(hand)
end


# tests
hand = ["Ace of Hearts", "3 of Spades", "Ace of Hearts"]
p hand_score(hand)

# system('clear')
# game_data = {}
# deck = initialize_deck(game_data)
# p deck
# puts
# hands = initialize_hands(game_data)
# deal_starting_hands(deck, hands)
# p game_data[:hands]
# puts
# p deck
# puts
# display_both_hands(game_data)



# OUTLINE
# 1. Initialize deck
# 2. Deal cards to player and dealer

# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
