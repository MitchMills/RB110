SUITS = %w[Clubs Diamonds Hearts Spades]
FACE_VALUES = ('2'..'10').to_a + %w[Jack Queen King Ace]
ONE_DECK = FACE_VALUES.each_with_object([]) do |value, deck|
  SUITS.each { |suit| deck << "#{value} of #{suit}" }
end

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
  game_data[:hands] = {player: [], dealer: []}
end

def deal_one_card(deck, hand)
  hand << deck.pop
end

def deal_initial_hands(deck, hands)
  2.times do
    deal_one_card(deck, hands[:player])
    deal_one_card(deck, hands[:dealer])
  end
end


# score methods
def hand_score(hand)
  raw_score = get_raw_score(hand)
  adjust_score(hand, raw_score) if raw_score > 21
end

def get_raw_score(hand)
  values = hand.map { |card| card.split.first }
  values.map do |value|
    value.to_i > 0 ? value.to_i : face_card_value(value)
  end.sum
end

def face_card_value(value)
  %w[Jack Queen King].include?(value) ? 10 : 11
end

def adjust_score(hand, score)
  aces = hand.map { |card| card.split.first }.count('Ace')
  aces.times { score -= 10 if score > 21 }
  score
end


# tests
hand = ["King of Hearts", "3 of Spades", "9 of Hearts"]
p hand_score(hand)

# game_data = {}
# deck = initialize_deck(game_data)
# p deck
# puts
# hands = initialize_hands(game_data)
# deal_initial_hands(deck, hands)
# p game_data[:hands]
# puts
# p deck



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
