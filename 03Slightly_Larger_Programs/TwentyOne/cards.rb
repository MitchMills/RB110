SUITS = %w(Clubs Diamonds Hearts Spades)
FACE_VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)

CARDS_IN_ONE_DECK = SUITS.size * FACE_VALUES.size
DECKS_IN_GAME = 1
CARDS_IN_GAME = CARDS_IN_ONE_DECK * DECKS_IN_GAME
RESHUFFLE_SIZE = 0.25

DEALER_STAY = 17
TARGET_SCORE = 21


# general methods
def prompt(message, action = :puts)
  action == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line(number = 1)
  number.times { puts }
end



# deck / dealing methods
def initialize_deck(game_data)
  one_deck = FACE_VALUES.each_with_object([]) do |value, deck|
    SUITS.each { |suit| deck << "#{value} of #{suit}" }
  end
  game_data[:deck] = (one_deck * DECKS_IN_GAME).shuffle
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

def hit(game_data, person)
  deal_one_card(game_data, person)
  narrate_dealt_card(person, game_data[:hands][person].last)
  blank_line
  sleep(0.4)
end

def narrate_starting_deal(game_data)
  hands = game_data[:hands]
  hands[:dealer][1] = 'face-down card'
  cards = hands[:player].zip(hands[:dealer]).flatten

  prompt("Here's the deal:")
  sleep(0.8)
  cards.each_with_index do |card, index|
    person = index.even? ? :player : :dealer
    narrate_dealt_card(person, card)
  end
end

def narrate_dealt_card(person, card)
  prelude = person == :player ? ' You get' : '   The dealer gets'
  article = card == 'face-down card' ? 'a' : 'the'
  prompt("#{prelude} #{article} #{card}")
  sleep(0.8)
end



# scoring methods
def hand_score(hand, context = :all_cards)
  hand -= [hand[1]] unless context == :all_cards
  raw_score = raw_score(hand)
  adjust_for_aces(hand, raw_score)
end

def raw_score(hand)
  values = hand.map { |card| card.split.first }
  values.map do |value|
    value.to_i > 0 ? value.to_i : face_card_value(value)
  end.sum
end

def face_card_value(value)
  %w(Jack Queen King).include?(value) ? 10 : 11
end

def adjust_for_aces(hand, score)
  number_of_aces = hand.map { |card| card.split.first }.count('Ace')
  number_of_aces.times { score -= 10 if score > TARGET_SCORE }
  score
end

def busted?(hand)
  hand_score(hand) > TARGET_SCORE
end



# hand display methods # ORIGINAL
# def display_both_hands(game_data)
#   game_data[:hands].keys.each { |person| display_one_hand(game_data, person) }
# end

# def display_one_hand(game_data, person) # ORIGINAL
#   display_hand_title(person)
#   display_hand_cards(game_data, person)
#   display_hand_score(game_data, person)
#   blank_line
# end

# def display_hand_title(person) # ORIGINAL
#   title = person == :player ? "YOUR" : "DEALER'S"
#   puts "#{title} HAND:"
# end

# def display_hand_cards(game_data, person) # ORIGINAL
#   hand = game_data[:hands][person]
#   hand[1] = "Face-down Card" if person == :dealer
#   hand.each { |card| puts " #{card}" }
# end

# def display_hand_score(game_data, person) # ORIGINAL
#   hand = game_data[:hands][person]
#   score = person == :player ? hand_score(hand) : hand_score(hand, :visible)
#   label = person == :player ? "Card Value:" : "Visible Card Value:"
#   puts "#{label} #{score}"
# end

def display_both_hands(game_data, context = :all_cards) # new
  game_data[:hands].keys.each { |person| display_one_hand(game_data, person, context) }
end

def display_one_hand(game_data, person, context) # new
  display_hand_title(person)
  display_hand_cards(game_data, person, context)
  display_hand_score(game_data, person, context)
  blank_line
end

def display_hand_title(person) # new/same
  title = person == :player ? "YOUR" : "DEALER'S"
  puts "#{title} HAND:"
end

def display_hand_cards(game_data, person, context) # new
  hand = game_data[:hands][person]


  hand[1] = "Face-down Card" if person == :dealer && context == :visible_cards
  hand.each { |card| puts " #{card}" }
end

def display_hand_score(game_data, person, context) # new
  hand = game_data[:hands][person]
  label = 'Card Value:'
  label.prepend('Visible ') if person == :dealer && context == :visible_cards
  context = :all_cards if person == :player && context == :visible_cards
  score = hand_score(hand, context)
  puts "#{label} #{score}"
end



game_data = {}
initialize_deck(game_data)
deal_starting_hands(game_data)
p game_data[:hands][:player]
p game_data[:hands][:dealer]
puts
display_both_hands(game_data, :visible_cards)
puts
p game_data[:hands][:player]
p game_data[:hands][:dealer]
puts
display_both_hands(game_data)
puts
p game_data[:hands][:player]
p game_data[:hands][:dealer]
