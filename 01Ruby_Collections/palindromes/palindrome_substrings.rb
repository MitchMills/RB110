def palindrome_substrings(string)
  substrings = get_substrings(string)
  get_palindromes(substrings)
end

def get_substrings(string)
  (0..string.size - 2).map do |start_index|
    generate_substrings(string, start_index)
  end.flatten
end

def generate_substrings(string, start_index)
  (2..string.size - start_index).map do |substring_size|
    string[start_index, substring_size]
  end
end

def get_palindromes(substrings)
  substrings.select { |substring| substring == substring.reverse }
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
