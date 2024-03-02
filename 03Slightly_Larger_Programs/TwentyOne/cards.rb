SUITS = %w[Clubs Diamonds Hearts Spades]
FACE_VALUES = ('2'..'10').to_a + %w[Jack Queen King Ace]

# DECK = FACE_VALUES.each_with_object([]) do |value, deck|
#   SUITS.each { |suit| deck << "#{value} of #{suit}" }
# end

# p FACE_VALUES.product(SUITS).map { |card| card.join(' of ') }

p (FACE_VALUES * 4).zip(SUITS * 13).map { |card| card.join(' of ') }.size
