def max_sum(numbers)
  sequences = get_sequences(numbers)
  sums = sequences.map(&:sum)
  sums.max
end

def get_sequences(array)
  sequences = [[]]
  start_indexes = (0..(array.size - 1))

  start_indexes.each do |start_index|
    max_length = array.size - start_index
    lengths = (1..max_length)

    lengths.each do |length|
      sequences << array[start_index, length]
    end
  end

  sequences
end

p max_sum([]) == 0
p max_sum([1, 2, 3]) == 6
p max_sum([-1, -2, -3]) == 0
p max_sum([1, 2, 3, -1]) == 6
p max_sum([1, -1, 2, 3, -1, 2]) == 6
p max_sum([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6 # [4, -1, 2, 1]
