NUMERICS = ('0'..'9').to_a

def sum_of_numbers(string)
  numeric_strings = get_numeric_strings(string)
  integers = numeric_strings.map(&:to_i)
  integers.sum
end

def get_numeric_strings(string)
  numeric_strings = []
  num_string = ''

  string.each_char do |char|
    if NUMERICS.include?(char)
      num_string << char
    else
      numeric_strings << num_string unless num_string.empty?
      num_string = ''
    end
  end

  numeric_strings << num_string unless num_string.empty?
  numeric_strings
end

p sum_of_numbers("L12aun3ch Sch3oo451") == 469
p sum_of_numbers("HE2LL3O W1OR5LD") == 11
p sum_of_numbers("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog") == 3635
