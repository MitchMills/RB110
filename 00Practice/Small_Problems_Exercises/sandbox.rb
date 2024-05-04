def word_sizes(string)
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

def word_sizes1(string)
  words = string.split
  words.map do |word|
    size = word.size
    count = words.map(&:size).count(size)
    [size, count]
  end.uniq.to_h
end

p word_sizes1('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes1('Hey diddle diddle, the cat and the fiddle!') ==
  { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes1("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes1('') == {}
