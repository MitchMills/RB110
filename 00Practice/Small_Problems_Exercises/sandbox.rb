uppercase = ('A'..'Z').to_a * 2
lowercase = ('a'..'z').to_a * 2
ALPHABET = uppercase + lowercase
ALPHABET_LENGTH = 26
SHIFT_SIZE = -23

def letter_changes(string)
  string.chars.map { |char| ALPHABET.include?(char) ? shift(char) : char }.join
end

def shift(character)
  shift_size = SHIFT_SIZE % ALPHABET_LENGTH
  new_index = ALPHABET.index(character) + shift_size
  ALPHABET[new_index]
end
