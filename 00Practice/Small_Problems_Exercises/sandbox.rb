def even_substrings(string)
  even_substrings = get_even_substrings(string)
  even_substrings.size
end

def get_even_substrings(string)
  substrings = []
  last_index = string.size - 1

  (0..last_index).each do |start_index|
    add_even_substrings(string, start_index, substrings)
  end

  substrings
end

def add_even_substrings(string, start_index, substrings)
  max_size = string.size - start_index
  (1..max_size).each do |length|
    current_substring = string[start_index, length]
    substrings << current_substring if current_substring.to_i.even?
  end
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
