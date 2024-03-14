SUITS = %w(Clubs Diamonds Hearts Spades)
FACE_VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)

CARDS_IN_ONE_DECK = SUITS.size * FACE_VALUES.size
DECKS_IN_GAME = 1
CARDS_IN_GAME = CARDS_IN_ONE_DECK * DECKS_IN_GAME
RESHUFFLE_TRIGGER = 0.25

DEALER_STAY_TOTAL = 17
TARGET_TOTAL = 21
CARDS_IN_FIRST_DEAL = 2

ROLES = [:player1, :dealer]

def initialize_game_data ##
  ROLES.each_with_object({}) { |person, game_data| game_data[person] = {} }
end

def initialize_deck ##
  one_deck = FACE_VALUES.each_with_object([]) do |value, deck|
    SUITS.each { |suit| deck << "#{value} of #{suit}" }
  end
  (one_deck * DECKS_IN_GAME).shuffle
end

def deal_starting_hands(deck, game_data) ##
  initialize_hands(game_data)
  CARDS_IN_FIRST_DEAL.times { deal_card_to_all_players(deck, game_data) }
  card_totals(game_data)
end

def initialize_hands(game_data) ##
  ROLES.each { |person| game_data[person][:hand] = { cards: [] } }
end

def deal_card_to_all_players(deck, game_data) ##
  ROLES.each { |person| deal_one_card(game_data[person][:hand][:cards], deck) }
end

def deal_one_card(hand, deck) ##
  hand << deck.shift
end


def card_totals(game_data)
  ROLES.each do |person|
    game_data[person][:hand][:total] = total(game_data[person][:hand][:cards])
  end

  dealer_hand = game_data[:dealer][:hand]
  dealer_hand[:visible_total] = total(dealer_hand[:cards], :visible_cards)
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

game_data = initialize_game_data
p game_data
deck = initialize_deck

p deck.size
deal_starting_hands(deck, game_data)
p game_data
p deck.size



# possible game_data structure
game_data2 = {
  player1: {
    hand: {
      cards: [],
      total: 0
    },
    wins: 0
  },
  dealer: {
    hand: {
      cards: [],
      total: 0
    },
    wins: 0
  }
}
