SUITS = %w(Clubs Diamonds Hearts Spades)
FACE_VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)

CARDS_IN_ONE_DECK = SUITS.size * FACE_VALUES.size
DECKS_IN_GAME = 1
CARDS_IN_GAME = CARDS_IN_ONE_DECK * DECKS_IN_GAME
RESHUFFLE_TRIGGER = 0.25

DEALER_STAY = 17
TARGET_TOTAL = 21

def initialize_deck
  one_deck = FACE_VALUES.each_with_object([]) do |value, deck|
    SUITS.each { |suit| deck << "#{value} of #{suit}" }
  end
  (one_deck * DECKS_IN_GAME).shuffle
end

def deal_starting_hands(deck, game_data)
  initialize_hands(game_data)
  2.times do
    [:player, :dealer].each { |person| deal_one_card(person, deck, game_data) }
  end
end

def initialize_hands(game_data)
  [:player, :dealer].each { |person| game_data[person] = { hand: [], total: 0 } }
end

def deal_one_card(person, deck, game_data)
  hand = game_data[person][:hand]
  card = deck.shift
  hand << card
  game_data[person][:total] += total(hand) ####### hand total: how to account for aces if doing cards individually?
end


#######
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
#########

game_data = { player: {}, dealer: {} }
deck = initialize_deck

deal_starting_hands(deck, game_data)
p game_data



# possible game_data structure
game_data2 = {
  deck: [],
  player: { hand: [], total: 0 },
  dealer: { hand: [], total: 0 }
}
