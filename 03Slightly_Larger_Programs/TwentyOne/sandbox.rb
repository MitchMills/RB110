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
