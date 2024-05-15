# LOWERCASE = ('a'..'z').to_a
# UPPERCASE = ('A'..'Z').to_a
# CONVERTER = LOWERCASE + UPPERCASE + LOWERCASE

# def swapcase(string)
#   string.chars.map do |char|
#     CONVERTER.include?(char) ? CONVERTER[CONVERTER.index(char) + 26] : char
#   end.join
# end

#####
# UPPERCASE = ('A'..'Z').to_a
# LOWERCASE = ('a'..'z').to_a
# SWAP_HASH = (UPPERCASE.zip(LOWERCASE) + LOWERCASE.zip(UPPERCASE)).to_h

# def swapcase(string)
#   string.chars.map { |char| SWAP_HASH[char] || char }.join
# end
#####
UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a
ALL_LETTERS = UPPERCASE + LOWERCASE
LETTER_SWAPPER = UPPERCASE + LOWERCASE.reverse

def swapcase(string)
  string.chars.map do |char|
    ALL_LETTERS.include?(char) ? change_case(char) : char
  end.join
end

def change_case(char)
  char_idx = ALL_LETTERS.index(char)
  char_idx < 26 ? char_idx += 26 : char_idx -= 26
  ALL_LETTERS[char_idx]
end

def change_case(char)
  char_idx = UPPERCASE.index(char) || LOWERCASE.index(char)
  UPPERCASE.include?(char) ? LOWERCASE[char_idx] : UPPERCASE[char_idx]
end

def change_case(char)
  char_idx = UPPERCASE.index(char) || LOWERCASE.index(char)
  UPPERCASE.include?(char) ? ALL_LETTERS[char_idx + 26] : ALL_LETTERS[char_idx]
end

def change_case(char)
  char_idx = UPPERCASE.index(char) || LOWERCASE.index(char)
  swap_idx = UPPERCASE.include?(char) ? -(char_idx + 1) : char_idx
  LETTER_SWAPPER[swap_idx]
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
