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

def hand_total_label(context)
  context == :visible_cards ? 'Visible Card Value:' : 'Card Value:'
  # label = 'Card Value:'
  # label.prepend('Visible ') if context == :visible_cards
  # label
end

p hand_total_label(:all_cards)



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
      total: 0,
      visible_total: 0
    },
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

# game_data[:player1][:hand][:cards]
