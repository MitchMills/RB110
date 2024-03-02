SUITS = %w(Clubs Diamonds Hearts Spades)
FACE_VALUES = ('2'..'10').to_a + %w(Jack Queen King Ace)

BLACKJACK = 21
BUSTED = 22

# general methods
def prompt(message, action = :puts)
  action == :print ? print("=> #{message}") : puts("=> #{message}")
end

def blank_line(number = 1)
  number.times { puts }
end

# game setup methods
def set_up_game(game_data)
  deck = initialize_deck(game_data)
  deal_starting_hands(game_data)
end

# deck methods
def initialize_deck(game_data, number = 1)
  one_deck = FACE_VALUES.each_with_object([]) do |value, deck|
    SUITS.each { |suit| deck << "#{value} of #{suit}" }
  end
  game_data[:deck] = (one_deck * number).shuffle
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

def display_dealt_card(game_data, card)
  prelude = person == :player ? 'You get' : 'The dealer gets'
  prompt("#{prelude} the #{card}")
  sleep(0.8)
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
  game_data[:hands].keys.each { |person| display_hand_info(game_data, person) }
end

def display_hand_info(game_data, person)
  title = person == :player ? "YOUR" : "DEALER'S"
  puts "#{title} HAND:"
  display_hand(game_data, person)
  display_score(game_data, person)
  blank_line
end

def display_hand(game_data, person)
  hand = game_data[:hands][person]
  hand[1] = "Face-down Card" if person == :dealer
  hand.each { |card| puts " #{card}" }
end

def display_score(game_data, person)
  hand = game_data[:hands][person]
  score = person == :player ? hand_score(hand) : visible_score(hand)
  label = person == :player ? "Card Value:" : "Visible Card Value:"
  puts "#{label} #{score}"
end

# player turn methods
def player_turn(game_data)
  system('clear')
  loop do
    display_both_hands(game_data)
    choice = hit_or_stay
    break if choice == 's'
    deal_one_card(game_data, :player)
    break if busted?(game_data[:hands][:player])
  end
  puts "stay or busted"
end

def hit_or_stay
  prompt("hit or stay?")
  gets.chomp
end

def busted?(hand)
  hand_score(hand) >= BUSTED
end

# main game loop
# system('clear')
# game_data = {}
# set_up_game(game_data)
# player_turn(game_data)


# tests
system('clear')
game_data = {}
game_data[:deck] = ["5 of Diamonds", "2 of Diamonds", "6 of Spades", "2 of Spades", "3 of Spades", "3 of Diamonds", "9 of Hearts", "6 of Clubs", "Jack of Hearts", "8 of Diamonds", "10 of Clubs", "7 of Clubs", "8 of Spades", "Queen of Hearts", "5 of Clubs", "Jack of Clubs", "Queen of Clubs", "6 of Diamonds", "9 of Diamonds", "10 of Diamonds", "Queen of Diamonds", "8 of Hearts", "7 of Hearts", "2 of Hearts", "Jack of Diamonds", "9 of Clubs", "9 of Spades", "Ace of Spades", "3 of Clubs", "5 of Spades", "3 of Hearts", "King of Clubs", "Queen of Spades", "4 of Spades", "7 of Diamonds", "2 of Clubs", "5 of Hearts", "10 of Hearts", "Ace of Diamonds", "6 of Hearts", "King of Diamonds", "8 of Clubs", "King of Hearts", "4 of Diamonds", "Ace of Clubs", "Jack of Spades", "7 of Spades", "10 of Spades", "4 of Clubs", "4 of Hearts", "Ace of Hearts", "King of Spades"]

deal_starting_hands(game_data)

# p game_data[:hands]






# OUTLINE
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
#
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
