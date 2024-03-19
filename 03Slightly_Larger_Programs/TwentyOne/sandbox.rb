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

def reshuffle(deck)
  (deck.clear << [4, 5, 6]).flatten!
end

deck = [1, 2, 3]
reshuffle(deck)
p deck







# possible game_data structure
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

game_data3 = {
  :player=>{
    :hand=>{
      :cards=>["8 of Hearts", "10 of Diamonds"],
      :total=>18
    }
    },
  :dealer=>{
    :hand=>{
      :cards=>["6 of Clubs", "Queen of Diamonds"],
      :total=>16,
      :visible_total=>6}
  }
}

# game_data[:player][:wins]
