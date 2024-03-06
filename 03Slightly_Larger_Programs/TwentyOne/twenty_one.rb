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


# game setup methods
def intro
  system('clear')
  prompt("Welcome to Twenty One!")
  prompt("You will play against the dealer.")
  prompt("Enter any key to deal the first hand: ", :print)
  gets
  system('clear')
end

def round_set_up(game_data)
  system('clear')
  if game_data[:deck].size < CARDS_IN_GAME * RESHUFFLE_SIZE
    initialize_deck(game_data)
  end
  deal_starting_hands(game_data)
  narrate_starting_deal(game_data)
  blank_line
  display_both_hands(game_data)
end

def outro
  prompt("Thank you for playing Twenty One!")
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


# hand display methods
def display_both_hands(game_data)
  game_data[:hands].keys.each { |person| display_one_hand(game_data, person) }
end

def display_one_hand(game_data, person)
  display_hand_title(person)
  display_hand_cards(game_data, person)
  display_hand_score(game_data, person)
  blank_line
end

def display_hand_title(person)
  title = person == :player ? "YOUR" : "DEALER'S"
  puts "#{title} HAND:"
end

def display_hand_cards(game_data, person)
  hand = game_data[:hands][person]
  hand[1] = "Face-down Card" if person == :dealer
  hand.each { |card| puts " #{card}" }
end

def display_hand_score(game_data, person)
  hand = game_data[:hands][person]
  score = person == :player ? hand_score(hand) : hand_score(hand, :visible)
  label = person == :player ? "Card Value:" : "Visible Card Value:"
  puts "#{label} #{score}"
end


# turn methods
def player_turn(game_data)
  loop do
    choice = hit_or_stay
    break if choice == 's'
    hit(game_data, :player)
    display_both_hands(game_data)
    break if busted?(game_data[:hands][:player])
  end
  prompt('You busted!') if busted?(game_data[:hands][:player])
  blank_line
  display_both_hands(game_data)
end

def hit_or_stay
  choice = player_choice
  sleep(0.4)
  system('clear')
  display_choice(choice)
  choice
end

def player_choice
  prompt("Would you like to hit, or stay?")
  loop do
    prompt("Enter 'h' to hit, or 's' to stay: ", :print)
    choice = gets.chomp
    return choice if %w(h s).include?(choice.downcase)
    prompt("I'm sorry, that's not a valid choice")
    blank_line
  end
end

def display_choice(choice)
  action = choice == 'h' ? 'hit' : 'stay'
  prompt("You chose to #{action}.")
  sleep(0.6)
end

def dealer_turn(game_data)
  loop do
    hand = game_data[:hands][:dealer]
    break prompt ('The dealer stayed.') if hand_score(hand) >= DEALER_STAY
    break prompt('The dealer busted!') if busted?(hand)
    prompt('The dealer hits.')
    hit(game_data, :dealer)
    display_both_hands(game_data)
    sleep(1)
  end
end

# round methods
def round_result(game_data)
  winner = determine_winner(game_data)
  display_round_result(game_data, winner)
end

def determine_winner(game_data)
  player_hand = game_data[:hands][:player]
  dealer_hand = game_data[:hands][:dealer]

  difference = hand_score(player_hand) - hand_score(dealer_hand)
  if difference > 0 || busted?(dealer_hand)
    :player
  elsif difference < 0 || busted?(player_hand)
    :dealer
  else
    :tie
  end
end

def display_round_result(game_data, result)
  system('clear')
  display_both_hands(game_data)
  blank_line
  if [:player, :dealer].include?(result)
    person = result == :player ? 'You' : 'The dealer'
    prompt("#{person} won!")
  else
    prompt("It's a tie.")
  end
end

def another_round?
  blank_line
  prompt("Enter 'y' to play another game. Enter any other key to stop playing.")
  gets.chomp.downcase == 'y'
end



# main game loop
intro
game_data = {}
initialize_deck(game_data)
loop do
  round_set_up(game_data)
  player_turn(game_data)
  dealer_turn(game_data) unless busted?(game_data[:hands][:player])
  # round_result(game_data)
  break #unless another_round?
end
# outro

# TODO: display dealer hand slowly; announce bust vs win etc

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
