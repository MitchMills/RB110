LOWERCASE = ('a'..'z').to_a

def is_pangram?(string)
  LOWERCASE.all? { |letter| string.downcase.count(letter) > 0 }
end
