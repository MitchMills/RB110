def get_all_substrings(string)
  all_substrings = []
  current_index = 0

  while current_index <= (string.length - 2)
    word_length = 2

    while word_length <= (string.length - current_index)
      all_substrings << string.slice(current_index, word_length)
      word_length += 1
    end

    current_index += 1
  end
  
  all_substrings
end


def palindrome?(substring)
  substring == substring.reverse
end


def palindrome_substrings(string)
  palindromes = []
  all_substrings = get_all_substrings(string)

  all_substrings.each do |substring|
    palindromes << substring if palindrome?(substring)
  end
  palindromes
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
