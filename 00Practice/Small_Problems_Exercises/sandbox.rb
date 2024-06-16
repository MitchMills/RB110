def triple_double(number1, number2)
  sequences1 = get_sequences(number1, 3)
  sequences2 = get_sequences(number2, 2)

  triples = get_multiples(sequences1)
  doubles = get_multiples(sequences2)

  unique_digits1 = triples.map { |triple| triple[0] }
  unique_digits2 = doubles.map { |double| double[0] }

  unique_digits1.any? { |digit| unique_digits2.include?(digit) }
end

def get_sequences(number, target_size)
  last_index = number.to_s.size - target_size
  (0..last_index).map { |start_index| number.to_s[start_index, target_size] }
end

def get_multiples(sequences)
  sequences.select do |sequence|
    digits = sequence.chars
    digits.all? { |digit| digit == digits[0] }
  end
end

p triple_double(12345, 12345) == false
p triple_double(1222345, 122345) == true
p triple_double(1222345, 123345) == false
p triple_double(666789, 12345666) == true
p triple_double(451999277, 41177722899) == true
