LOWERCASE = ('a'..'z').to_a

# def count_letters(string)
#   counts = Hash.new(0)
#   string.each_char do |char|
#     next unless LOWERCASE.include?(char)
#     counts[char] += 1
#   end
#   counts
# end

def count_letters(string)
  counts = {}
  string.each_char do |char|
    next unless LOWERCASE.include?(char)
    counts[char] = string.count(char)
  end
  counts
end

# expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
# p count_letters('woebegone') == expected

# expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
#             'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
# p count_letters('lowercase/uppercase') == expected

# expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
# p count_letters('W. E. B. Du Bois') == expected

# p count_letters('x') == {'x' => 1}
# p count_letters('') == {}
# p count_letters('!!!') == {}
