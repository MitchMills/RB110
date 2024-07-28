# def anagram_difference(string1, string2)
#   target_anagram = []

#   target_letters1 = string1.chars.select { |char| string2.include?(char) }
#   target_letters2 = string2.chars.select { |char| string1.include?(char) }

#   target_letters1.each do |char|
#     count1 = target_letters1.count(char)
#     count2 = target_letters2.count(char)
#     target_count = [count1, count2].min
#     target_anagram << char if target_anagram.count(char) < target_count
#   end

#   target_size = target_anagram.size
#   (string1.size - target_size) + (string2.size - target_size)
# end

#####
# def anagram_difference(string1, string2)
#   common_letters = string1.chars.select { |char| string2.include?(char) }.uniq

#   tally1 = string1.chars.tally
#   tally2 = string2.chars.tally

#   anagram_letters = ''
#   common_letters.each do |letter|
#     reps = [tally1[letter], tally2[letter]].min
#     anagram_letters << (letter * reps)
#   end
#   anagram_length = anagram_letters.size
#   (string1.size - anagram_length) + (string2.size - anagram_length)
# end

#####
# def anagram_difference(string1, string2)
#   anagram_length = get_anagram_length(string1, string2)
#   (string1.size - anagram_length) + (string2.size - anagram_length)
# end

# def get_anagram_length(string1, string2)
#   common_letters = get_common_letters(string1, string2)
#   letter_counts1, letter_counts2 = get_letter_counts(string1, string2)

#   common_letters.map do |letter|
#     [letter_counts1[letter], letter_counts2[letter]].min
#   end.sum
# end

# def get_common_letters(string1, string2)
#   string1.chars.select { |char| string2.include?(char) }.uniq
# end

# def get_letter_counts(string1, string2)
#   [string1.chars.tally, string2.chars.tally]
# end

#####
# def anagram_difference(string1, string2)
#   anagram_length = get_anagram_length(string1, string2)
#   (string1.size - anagram_length) + (string2.size - anagram_length)
# end

# def get_anagram_length(string1, string2)
#   common_letters = string1.chars.select { |char| string2.include?(char) }.uniq
#   letter_counts1, letter_counts2 = [string1.chars.tally, string2.chars.tally]

#   common_letters.map do |letter|
#     [letter_counts1[letter], letter_counts2[letter]].min
#   end.sum
# end

#####
# def anagram_difference(string1, string2)
#   common_letters = (string1 + string2).chars.uniq
#   # common_letters = string1.chars | string2.chars
#   common_letters.map do |letter|
#     (string1.count(letter) - string2.count(letter)).abs
#   end.sum
# end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10

p anagram_difference(
  "oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau",
  "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw"
  ) == 42
p anagram_difference(
  "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw",
  "oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau"
  ) == 42

p anagram_difference(
  "fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo",
  "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt"
  ) == 50
p anagram_difference(
  "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt",
  "fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo"
  ) == 50
