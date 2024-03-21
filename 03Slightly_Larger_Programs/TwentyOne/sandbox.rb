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

def turn(role, deck, game_data) # role = :player or :dealer
  turn_intro(role, game_data)
  loop do
    total = game_data[role][:total]
    continue_turn(role, game_data)
    choice = hit_or_stay
    break if choice == 's'
    hit(role, deck, game_data)
    display_both_hands(game_data, role)
    break if busted?(total)
  end
  turn_outro(role, game_data)
end

def turn_intro(role, game_data)
  'foo'
end

def continue_turn(role, game_data)
  'foo'
end

def hit_or_stay
  'foo'
end

def hit(role, deck, game_data)
  'foo'
end

def display_both_hands(game_data, role)
  'foo'
end

def busted?(total)
  total > TARGET_TOTAL
end




# current game_data structure
game_data2 = {
  player: {
    hand: [],
    total: 0,
    wins: 0
  },
  dealer: {
    hand: [],
    total: 0,
    visible_total: 0,
    wins: 0
  }
}
