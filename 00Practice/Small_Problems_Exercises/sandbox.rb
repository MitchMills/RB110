NUMBERS = %w(zero one two three four five six seven eight nine)

def word_to_digit(words)
  words.split.map do |word|
    NUMBERS.each_with_index do |number, index|
      word[number] = index.to_s if word.include?(number)
    end
    word
  end.join(' ')
end
