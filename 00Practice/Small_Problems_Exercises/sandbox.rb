def anagram_difference(string1, string2)
  target_anagram = []

  target_letters1 = string1.chars.select { |char| string2.include?(char) }
  target_letters2 = string2.chars.select { |char| string1.include?(char) }

  target_letters1.each do |char|
    count1 = target_letters1.count(char)
    count2 = target_letters2.count(char)
    target_count = [count1, count2].min
    target_anagram << char if target_anagram.count(char) < target_count
  end

  target_size = target_anagram.size
  (string1.size - target_size) + (string2.size - target_size)
end

# def anagram_difference(string1, string2)
#   shorter, longer = [string1, string2].sort_by(&:size)
#   anagram = shorter.chars.select { |char| longer.include?(char) }
#   (shorter.size - anagram.size) + (longer.size - anagram.size)
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

# p anagram_difference(
#   "oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau",
#   "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw"
#   ) == 42
# p anagram_difference(
#   "fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo",
#   "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt"
#   ) == 50
