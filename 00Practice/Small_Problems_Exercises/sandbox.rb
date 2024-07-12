def next_bigger_num(number)
  max_number = get_max_number(number)
  candidates = ((number + 1)..max_number)
  result = candidates.find { |candidate| same_digits?(candidate, number) }
  result || -1
end

def get_max_number(number)
  number.digits.sort.reverse.join.to_i
end

def same_digits?(candidate, target)
  candidate.digits.sort == target.digits.sort
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(315) == 351
p next_bigger_num(111) == -1
p next_bigger_num(13579) == 13597
p next_bigger_num(13573) == 13735
p next_bigger_num(13576) == 13657
p next_bigger_num(97531) == -1
