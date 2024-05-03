ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_string = string.chars.map do |char|
    ALPHABET.include?(char) ? char : ' '
  end.join.split.join(' ')
  ALPHABET.include?(string[0]) ? clean_string : clean_string.prepend(' ')
  ALPHABET.include?(string[-1]) ? clean_string : clean_string << ' '
end

p cleanup("---what's my +*& balloon?") #== ' what s my line '
