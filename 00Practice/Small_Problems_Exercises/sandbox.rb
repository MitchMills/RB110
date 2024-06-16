def triple_double(number1, number2)
  sequences = get_sequences([[number1, 3], [number2, 2]])
  multiples = get_multiples(sequences)
  triple_double?(multiples)
end

def get_sequences(numbers_array)
  numbers_array.map do |number, target_size|
    last_index = number.to_s.size - target_size
    (0..last_index).map { |start_index| number.to_s[start_index, target_size] }
  end
end

def get_multiples(sequences_array)
  sequences_array.map do |sequences|
    sequences.select do |sequence|
      digits = sequence.chars
      digits.all? { |digit| digit == digits.first }
    end
  end
end

def triple_double?(multiples)
  unique_digits = get_unique_digits(multiples)
  unique_digits.first.any? { |digit| unique_digits.last.include?(digit) }
end

def get_unique_digits(multiples_array)
  multiples_array.map { |multiples| multiples.map(&:chr) }
end

p triple_double(12345, 12345) == false
p triple_double(1222345, 122345) == true
p triple_double(1222345, 123345) == false
p triple_double(666789, 12345666) == true
p triple_double(451999277, 41177722899) == true
