def anagram_difference(string1, string2)
  common_characters = get_common_characters(string1, string2)
  anagram_length = common_characters.size
  (string1.size - anagram_length) + (string2.size - anagram_length)
end

def get_common_characters(string1, string2)
  string1.chars.each_with_object([]) do |char, common_characters|
    if string2.include?(char)
      common_count = common_characters.count(char)
      count2 = string2.count(char)
      common_characters << char unless common_count >= count2
    end
  end
end

p anagram_difference('', '') == 0                     # anagrams: '', ''
p anagram_difference('a', '') == 1                    # anagrams: '', ''
p anagram_difference('', 'a') == 1                    # anagrams: '', ''
p anagram_difference('ab', 'a') == 1                  # anagrams: 'a', 'a'
p anagram_difference('ab', 'ba') == 0                 # anagrams: 'ab', 'ba'
p anagram_difference('ab', 'cd') == 4                 # anagrams: '', ''
p anagram_difference('a', 'aab') == 2                 # anagrams: 'a', 'a'
p anagram_difference('codewarrs', 'hackerank') == 10 # anagrams: 'cear', 'acer'
p anagram_difference('hackerank', 'codewarrs') == 10 # anagrams: 'cear', 'acer'
