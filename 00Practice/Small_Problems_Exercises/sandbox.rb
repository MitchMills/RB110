def even_substrings(string)
  substrings = get_substrings(string)
  even_substrings = substrings.select { |substring| substring.to_i.even? }
  even_substrings.size
end

def get_substrings(string)
  substrings = []

  string.chars.each_index do |start_index|
    max_length = string.size - start_index
    lengths = (1..max_length)

    lengths.each do |length|
      substrings << string[start_index, length]
    end
  end

  substrings
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
