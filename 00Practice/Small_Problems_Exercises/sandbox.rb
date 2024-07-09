def anagram?(string1, string2)
  all_letters = (string1 + string2).chars.uniq.join.downcase
  string1, string2 = [string1, string2].map(&:downcase)

  all_letters.chars.all? { |char| string1.count(char) == string2.count(char) }
end

p anagram?('Creative', 'Reactive') == true
p anagram?('Creative', 'Reactived') == false
p anagram?('bold', 'DLOB') == true
p anagram?('apple', 'apple') == true
p anagram?('Apple', 'apple') == true
p anagram?('apple', 'apply') == false
p anagram?('apple', 'appl') == false
p anagram?('', '') == true
