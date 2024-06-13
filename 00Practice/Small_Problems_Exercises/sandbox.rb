def next_bigger_num(number)
  find_next_bigger(number) || -1
end

def find_next_bigger(number)
  start_number = number + 1
  max_number = find_max_number(number)
  (start_number..max_number).find do |candidate|
    same_digits?(number, candidate)
  end
end

def find_max_number(number)
  number.digits.sort.reverse.join.to_i
end

def same_digits?(number, candidate)
  number.digits.sort == candidate.digits.sort
end
