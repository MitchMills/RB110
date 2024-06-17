def longest(string)
  all_substrings = get_all_substrings(string)
  alphabetical_substrings = get_alphabetical_substrings(all_substrings)
  alphabetical_substrings.max_by(&:size)
end

def get_all_substrings(string)
  all_substrings = []
  last_index = string.size - 1

  (0..last_index).each do |start_index|
    max_length = string.size - start_index

    (1..max_length).each do |length|
      all_substrings << string[start_index, length]
    end
  end

  all_substrings
end

def get_alphabetical_substrings(substrings)
  substrings.select { |substring| alphabetical?(substring) }
end

def alphabetical?(string)
  string.chars == string.chars.sort
end

#####
# def longest(string)
#   substrings = get_substrings(string)
#   substrings.max_by(&:size)
# end

# def get_substrings(string)
#   substrings = []
#   last_index = string.size - 1

#   (0..last_index).each do |start_index|
#     max_size = string.size - start_index
#     (1..max_size).each do |length|
#       substring = string[start_index, length]
#       substrings << substring if alphabetical?(substring)
#     end
#   end
#   substrings
# end

# def alphabetical?(string)
#   string.chars == string.chars.sort
# end

p longest('abc') == 'abc'
p longest('abcace') == 'abc'
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
