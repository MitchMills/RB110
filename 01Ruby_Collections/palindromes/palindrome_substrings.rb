def get_substrings(string)
  starting_index = 0
  substrings = []
  while starting_index <= (string.length - 2)
    substring_length = 2
    while substring_length <= (string.length - starting_index)
      current_substring = string.slice(starting_index, substring_length)
      substrings << current_substring
      substring_length += 1
    end
    starting_index += 1
  end
  substrings
end

def palindrome?(substring)
  substring == substring.reverse
end

def palindrome_substrings(string)
  palindromes = []
  substrings = get_substrings(string)
  substrings.each do |substring|
    palindromes << substring if palindrome?(substring)
  end
  palindromes
end

puts palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
puts palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
puts palindrome_substrings("palindrome") == []
puts palindrome_substrings("") == []
