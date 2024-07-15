UPPERCASE = ('A'..'Z').to_a

def decode(strings)
  strings.map do |string|
    uppercase_indexes = get_uppercase_indexes(string)
    uppercase_indexes.size < 2 ? 0 : index_difference(uppercase_indexes)
  end
end

def get_uppercase_indexes(string)
  indexes = string.chars.each_index.to_a
  indexes.select { |index| UPPERCASE.include?(string[index]) }
end

def index_difference(array)
  array.take(2).inject(:-).abs - 1
end

p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []
