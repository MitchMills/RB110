### DELETE A DIGIT
def delete_digit(number)
  size = number.to_s.size
  digits = number.digits.reverse

  possibles = (0...size).map do |index|
    digits.select.with_index { |digit, idx| idx != index }
  end

  possibles.map(&:join).map(&:to_i).sort.last
end

# def delete_digit(number) # DOESN'T WORK
#   string = number.to_s

#   possibles = (0...string.size).map do |index|
#     current_char = string[index]
#     string.delete(current_char)
#   end

#   possibles.map(&:to_i).sort.last
# end

p delete_digit(791983) #== 91983
p delete_digit(152) #== 52
p delete_digit(1001) #== 101
p delete_digit(10) #== 1
puts
p delete_digit(12345) == 2345
p delete_digit(54321) == 5432
p delete_digit(12321) == 2321
p delete_digit(32123) == 3223
