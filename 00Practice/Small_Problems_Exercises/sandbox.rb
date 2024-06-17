ALPHABET = ('a'..'z').to_a.prepend('0')

def alphabet_score(words)
  words.split.max_by { |word| word_score(word) }
end

def word_score(word)
  word.chars.map { |char| ALPHABET.index(char) }.sum
end

p alphabet_score('time is up') == 'time'
p alphabet_score('time to stop') == 'stop'
p alphabet_score('aced up') == 'up'
p alphabet_score('ebb ace') == 'ebb'
p alphabet_score('c ba') == 'c'
