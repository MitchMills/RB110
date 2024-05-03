def swap(string)
  string.split.map do |word|
    first, last = swap_first_last_characters(word[0], word[-1])
    word.size == 1 ? word : "#{first}#{word[1..-2]}#{last}"
  end.join(' ')
end

def swap_first_last_characters(first, last)
  first, last = last, first
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
