def twice(number)
  double_number?(number) ? number : number * 2
end

def double_number?(number)
  number.to_s.size.even? ? sides_equal?(number) : false
end

def sides_equal?(number)
  characters = number.to_s.chars
  half = characters.size / 2
  characters.take(half) == characters.drop(half)
end
