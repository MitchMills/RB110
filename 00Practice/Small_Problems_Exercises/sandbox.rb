def unscramble1(string1, string2)
  string1_hash = string1.chars.tally
  string2.chars.all? do |char|
    string1_hash[char] && string1_hash[char] >= string2.count(char)
  end
end

def unscramble(string1, string2)
  string2.chars.all? { |char| string1.count(char) >= string2.count(char) }
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true
