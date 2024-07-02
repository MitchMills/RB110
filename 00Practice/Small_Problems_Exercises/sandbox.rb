def repeated_substring(string)
  1.upto(string.size).each do |current_length|
    current_substring = string[0, current_length]
    repeat_count = string.length / current_length
    pair = [current_substring, repeat_count]
    return pair if pair.inject(:*) == string
  end
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]
