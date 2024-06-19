UPPERCASE = ('A'..'Z').to_a

def decode(strings)
  uppercase_indexes = get_uppercase_indexes(strings)
  get_codes(uppercase_indexes)
end

def get_uppercase_indexes(strings)
  strings.map do |string|
    string.chars.each_index.select { |index| UPPERCASE.include?(string[index]) }
  end
end

def get_codes(array)
  array.map { |indexes| indexes.size < 2 ? 0 : (indexes[1] - indexes[0]) - 1 }
end

p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []
