LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a
ALL_LETTERS = LOWERCASE + UPPERCASE

def word_cap(string)
  string.split.map do |word|
    word.chars.map.with_index { |char, index| change_case(char, index) }.join
  end.join(' ')
end

def change_case(char, index)
  if ALL_LETTERS.include?(char)
    char_index = LOWERCASE.index(char) || UPPERCASE.index(char)
    index == 0 ? UPPERCASE[char_index] : LOWERCASE[char_index]
  else
    char
  end
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
