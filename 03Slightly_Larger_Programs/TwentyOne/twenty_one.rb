SUITS = %w[Clubs Diamonds Hearts Spades]
FACE_VALUES = ('2'..'10').to_a + %w[Jack Queen King Ace]

ONE_DECK = FACE_VALUES.each_with_object([]) do |value, deck|
  SUITS.each { |suit| deck << "#{value} of #{suit}" }
end

# general methods
def prompt(message, action = :puts)
  action == :print ? print("=> #{message}") : puts("=> #{message}")
end

# deck methods
def initialize_deck(number = 1)
  (ONE_DECK * number).shuffle
end

def deal_initial_hands(deck)
  hands = {player: [], dealer: []}
  2.times do
    hands[:player][:hand] << deck.pop
    hands[:dealer][:hand] << deck.pop
  end
  hands
end

# score methods
def hand_score(hand)
  values = hand.map { |card| card.split.first }
  values.map do |value|
    value.to_i > 0 ? value.to_i : face_card_value(value)
  end
end


# deck = initialize_deck
# hands = deal_initial_hands(deck)

hands = {:player=>["6 of Diamonds", "4 of Diamonds"], :dealer=>["7 of Hearts", "2 of Diamonds"]}

p hand_score(hands[:player])

# 1. Initialize deck
# 2. Deal cards to player and dealer

# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
