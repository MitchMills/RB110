def first_and_last_case(string)
  multiples = get_multiples(string)
  indexes = get_indexes(multiples, string)
  string.chars.map.with_index do |char, index|
    indexes.include?(index) ? char.upcase : char
  end.join
end

def get_multiples(string)
  string.chars.uniq.select { |char| string.count(char) > 1 }
end

def get_indexes(multiples, string)
  all_indexes = multiples.map do |letter|
    string.chars.each_index.select { |index| string[index] == letter }
  end
  all_indexes.flat_map { |indexes| [indexes.first, indexes.last] }
end

p first_and_last_case('abc') == 'abc'
p first_and_last_case('aaabc') == 'AaAbc'
p first_and_last_case('aaabccbb') == 'AaABCCbB'

string = 'thequickbrownfoxjumpsoverthelazydog'
new_string = 'THEqUickbROwnfoxjUmpsoveRTHElazydOg'
p first_and_last_case(string) == new_string
