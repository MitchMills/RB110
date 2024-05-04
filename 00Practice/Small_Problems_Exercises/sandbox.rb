def word_sizes1(string)
  counts = Hash.new(0)
  string.split.each { |word| counts[word.size] += 1 }
  counts
end

def word_sizes2(string)
  string.split.each_with_object(Hash.new(0)) do |word, counts|
    counts[word.size] += 1
  end
end

def word_sizes3(string)
  string.split.map(&:size).tally
end

def word_sizes(string)
  sizes = string.split.map(&:size)
  sizes.map { |size| [size, sizes.count(size)] }.to_h
end

def word_sizes6(string)
  word_sizes = string.split.map(&:size)
  Hash.new { |counts, size| counts[size] = word_sizes.count(size) }
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') ==
  { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
