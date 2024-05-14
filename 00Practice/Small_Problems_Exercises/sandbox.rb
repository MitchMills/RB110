LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a
CONVERTER = LOWERCASE + UPPERCASE + LOWERCASE

def swapcase(string)
  string.chars.map do |char|
    CONVERTER.include?(char) ? CONVERTER[CONVERTER.index(char) + 26] : char
  end.join
end

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
