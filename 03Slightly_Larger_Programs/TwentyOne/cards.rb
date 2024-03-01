SUITS = %w[Clubs Diamonds Hearts Spades]
FACE_VALUES = ('2'..'10').to_a + %w[Jack Queen King Ace]

DECK = FACE_VALUES.each_with_object([]) do |value, deck|
  SUITS.each { |suit| deck << "#{value} of #{suit}" }
end

DECK.shuffle!
p DECK
p DECK.pop.split.first
