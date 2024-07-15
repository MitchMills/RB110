def to_weird_case(string)
  words = string.split
  words.map.with_index do |word, index|
    target?(index, 3) ? change_chars(word) : word
  end.join(' ')
end

def target?(index, target)
  (index + 1) % target == 0
end

def change_chars(word)
  characters = word.chars
  characters.map.with_index do |character, index|
    target?(index, 2) ? character.upcase : character
  end.join
end

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected
