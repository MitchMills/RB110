NUMERICS = ('0'..'9').to_a

def sum_of_numbers(string)
  numeric_characters = get_numeric_characters(string)
  integers = numeric_characters.map(&:to_i)
  integers.sum
end

def get_numeric_characters(string)
  string.chars.map { |char| NUMERICS.include?(char) ? char : ' ' }.join.split
end

p sum_of_numbers("L12aun3ch Sch3oo451") #== 469
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203j914ov3r1349the102l4zy dog") == 3635
