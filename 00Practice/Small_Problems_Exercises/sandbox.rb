def longest(string)
  substrings = get_substrings(string)
  alpha_substrings = substrings.select { |substring| alphabetical?(substring) }
  max_length = alpha_substrings.map(&:size).max
  alpha_substrings.find { |substring| substring.size == max_length }
end

def get_substrings(string)
  substrings = []
  min_length = 1
  last_index = string.size - min_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    max_length = string.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length|
      substrings << string[start_index, length]
    end
  end

  substrings
end

def alphabetical?(string)
  string.chars.sort == string.chars
end

p longest('abc') == 'abc'
p longest('abcace') == 'abc'
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
