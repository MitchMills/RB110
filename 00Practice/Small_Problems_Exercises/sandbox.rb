require 'pry-byebug'
UPPERCASE = ('A'..'Z').to_a

def decode(strings)
  binding.pry
  strings.map do |string|
    indexes = get_indexes(string)
    indexes.size < 2 ? 0 : indexes.take(2).inject(:-).abs - 1
  end
end

def get_indexes(string)
  string.chars.each_index.select do |index|
    UPPERCASE.include?(string[index])
  end
end

p decode(['ZoL', 'heLlo', 'XX']) #== [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) #== [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) #== [8, 1]
p decode([]) #== []
