ALPHABET = ('a'..'z').to_a

def solve(strings)
  strings.map do |string|
    get_alphabet_position_letters(string)
  end
end

def get_alphabet_position_letters(string)
  string.chars.select.with_index do |char, index|
    ALPHABET.index(char.downcase) == index
  end.size
end

p solve(["abode", "ABc", "xyzD"]) == [4, 3, 1]
p solve(["abide", "ABc", "xyz"]) == [4, 3, 0]
p solve(["IAMDEFANDJKL", "thedefgh", "xyzDEFghijabc"]) == [6, 5, 7]
p solve(["encode", "abc", "xyzD", "ABmD"]) == [1, 3, 1, 3]
