def delete_digit(number)
  candidates = get_candidates(number)
  candidates.max
end

def get_candidates(number)
  all_digits = number.digits.reverse

  all_digits.each_index.map do |index|
    candidate_digits = number.digits.reverse
    candidate_digits.delete_at(index)
    candidate_digits.join.to_i
  end
end

p delete_digit(10) == 1
p delete_digit(12) == 2
p delete_digit(123) == 23
p delete_digit(321) == 32
p delete_digit(12345) == 2345
p delete_digit(62345) == 6345
p delete_digit(791983) == 91983
p delete_digit(1001) == 101
