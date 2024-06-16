def repeated_substring(string)
  substrings = get_substrings(string)
  repeated_substring?(string, substrings)
end

def get_substrings(string)
  substrings = []
  max_size = string.size / 2

  (1..max_size).each do |current_size|
    last_index = string.size - current_size
    (0..last_index).each do |start_index|
      substrings << string[start_index, current_size]
    end
  end

  substrings.uniq
end

def repeated_substring?(string, substrings)
  substrings.any? do |substring|
    multiplier = string.size / substring.size
    substring * multiplier == string
  end
end

p repeated_substring('aba') == false
p repeated_substring('aaa') == true
p repeated_substring('abab') == true
p repeated_substring('abcABC') == false
p repeated_substring('AabAaba') == false
p repeated_substring('aB@AbaB@Ab') == true
p repeated_substring('ab3ab3ab3') == true
