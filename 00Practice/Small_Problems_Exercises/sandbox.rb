def repeated_substring(string)
  substrings = get_substrings(string)
  pairs = substrings.map do |substring|
    repeat_count = string.size / substring.size
    [substring, repeat_count]
  end
  pairs.find { |pair| pair.inject(:*) == string }
end

def get_substrings(string)
  substrings = []
  lengths = (1..string.size)

  lengths.each do |length|
    substrings << string[0, length]
  end
  substrings
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]
