CARD_RANKS = [
  '2', '3', '4', '5', '6', '7', '8', '9', '10', 
  'Jack', 'Queen', 'King', 'Ace'
]
CARD_SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

CARD_VALUES = CARD_RANKS.each_with_object({}) do |rank, hash|
  if rank == "Ace"
    hash[rank] = 11
  elsif rank.to_i == 0
    hash[rank] = 10
  else
    hash[rank] = rank.to_i
  end
end

DEALER_STAY = 17
BLACKJACK = 21
BUSTED = 22

def prompt(message)
  puts "=> #{message}"
end

def welcome()
  system 'clear'
  prompt <<~HEREDOC
  Welcome to Twenty-One!
  => You will play against the Dealer. The player who
  => gets closest to 21 without going over wins.
  => Enter any key to begin.
  HEREDOC
  gets
end

def initialize_deck(number_of_decks = 1)
  one_deck = CARD_RANKS.product(CARD_SUITS).map do |card|
    card_info = {}
    card_info[:rank] = card[0]
    card_info[:suit] = card[1]
    card_info[:value] = CARD_VALUES[card[0]]
    card_info
  end
  (one_deck * number_of_decks).shuffle
end

def initial_deal(deck, hands)
  deal_order = deal_initial_hands(deck, hands)
  display_initial_deal(hands, deal_order)
end

    def deal_initial_hands(deck, hands)
      deal_order = []
      2.times do
        deal_order << deal_card(deck, hands[:player]).last
        deal_order << deal_card(deck, hands[:dealer]).last
      end
      card_names(deal_order).each { |card| card.prepend("the ") }
    end

    def deal_card(deck, hand)
      hand << deck.pop
    end

    def card_names(hand)
      hand.map do |card|
        "#{card[:rank]} of #{card[:suit]}"
      end
    end

    def display_initial_deal(hands, deal_order)
      deal_order[3] = "a facedown card"
      prompt("Here's the deal:")
      show_each_card(deal_order)
      puts
    end

    def show_each_card(deal_order)
      deal_order.each_with_index do |card, idx|
        sleep(0.7)
        if idx.even?
          prompt("  You get #{deal_order[idx]}")
        else
          prompt("    The dealer gets #{deal_order[idx]}")
        end
      end
    end

    def display_both_hands(hands, context)
      display_hand(hands, :dealer, context)  
      display_hand(hands, :player, :all_cards)
    end

    def display_hand(hands, owner, context)
      prompt(owner == :player ? "Your hand:" : "Dealer hand:")
      hand = card_names(hands[owner])
      hand[1] = "Facedown Card" if context == :face_up_cards
      hand.each { |card| prompt(" #{card}") }
      display_total(hands[owner], context)
      puts
    end

def display_total(hand, context)
  label = (context == :face_up_cards) ? "Visible card value: " : "Card value: "
  prompt(label + "#{total(hand, context)}")
end

    def total(hand, context)
      sum = hand.map { |card| card[:value] }.sum
      sum -= hand[1][:value] if context == :face_up_cards
      sum = correct_for_aces(hand, sum)
    end

    def correct_for_aces(hand, sum)
      hand.select { |card| card[:rank] == "Ace" }.count.times do
        sum -= 10 if sum > 21
      end
      sum
    end

def check_for_blackjack(hands, result)
  result = result_of_blackjack(hands)
  if result == :player_wins
    prompt("You have blackjack!")
  elsif result == :dealer_wins
    prompt("The dealer has blackjack!")
  elsif result == :tie
    prompt("Both you and the dealer have blackjack!")
  end
  # result
end

    def result_of_blackjack(hands)
      if blackjack?(hands[:player])
        blackjack?(hands[:dealer]) ? :tie : :player_wins
      elsif blackjack?(hands[:dealer])
        :dealer_wins
      else
        :continue
      end
    end

    def blackjack?(hand)
      total(hand, :all_cards) == BLACKJACK
    end

def player_turn(deck, hands)
  loop do
    answer = hit_or_stay(hands)
    if answer == "hit"
      system 'clear'
      prompt("You have chosen to hit:")
      hit(deck, hands, :player)
    end
    break if busted?(hands[:player]) || answer == "stay"    
  end

  if busted?(hands[:player])
    display_both_hands(hands, :all_cards)
    prompt("Busted!")
    return :dealer_wins
  else
    prompt("You chose to stay.")
    return :continue
  end
end

    def hit_or_stay(hands)
      answer = nil
      loop do
        display_both_hands(hands, :face_up_cards)
        prompt("Would you like to hit or stay?")
        answer = gets.chomp.downcase
        break if ["hit", "stay"].include?(answer)
        system 'clear'
        prompt("Sorry, that's not a valid response. Please try again.")
        puts
      end
      answer
    end

    def hit(deck, hands, owner)
      deal_card(deck, hands[owner])
      prelude = (owner == :player) ? "You get " : "The dealer gets "
      prompt(prelude + "the #{card_names(hands[owner]).last}.")
      puts
    end

    def busted?(hand)
      total(hand, :all_cards) >= BUSTED
    end

def dealer_turn(deck, hands)
  loop do
    break if total(hands[:dealer], :all_cards) >= DEALER_STAY
    system 'clear'
    prompt("The dealer has chosen to hit:")
    hit(deck, hands, :dealer)
    display_both_hands(hands, :all_cards)
    gets
  end

  if busted?(hands[:dealer])
    display_both_hands(hands, :all_cards)
    prompt("Busted!")
    return :player_wins
  else
    prompt("The dealer has chosen to stay.")
    return :continue
  end
end

def determine_result(hands)
  if total(hands[:player], :all_cards) > total(hands[:dealer], :all_cards)
    return :player_wins
  elsif total(hands[:dealer], :all_cards) > total(hands[:player], :all_cards)
    return :dealer_wins
  else
    return :tie
  end
end

    def display_result(hands, result) #####
      system 'clear'
      display_both_hands(hands, :all_cards)
      if result == :player_wins
        prompt("You have won this hand!")
      elsif result == :dealer_wins
        prompt("The dealer won this hand.")
      elsif result == :tie
        prompt("It's a tie.")
      end
    end

#####

def play_one_hand(deck, hands)
  initial_deal(deck, hands)
  result = nil
  loop do
    check_for_blackjack(hands, result)
    break unless result == :continue # :player_wins, :dealer_wins, :tie

    result = player_turn(deck, hands)
    break unless result == :continue # :dealer_wins

    result = dealer_turn(deck, hands)
    break unless result == :continue # player_wins

    result = determine_result(hands) # :player_wins, :dealer_wins, :tie
    break
  end
  result
end

#####

hands = { 
    player: [{:rank=>"Ace", :suit=>"Clubs", :value=>11}, {:rank=>"King", :suit=>"Spades", :value=>10}],
    dealer: [{:rank=>"9", :suit=>"Spades", :value=>9}, {:rank=>"King", :suit=>"Clubs", :value=>10}]
  }

  welcome()