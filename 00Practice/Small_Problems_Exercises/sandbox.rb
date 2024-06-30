def to_weird_case(string)
  words = string.split
  weird_words = words.map.with_index do |word, index|
    (index + 1) % 3 == 0 ? change_word(word) : word
  end
  weird_words.join(' ')
end

def change_word(word)
  characters = word.chars
  characters.map.with_index do |character, index|
    index.odd? ? character.upcase : character
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
