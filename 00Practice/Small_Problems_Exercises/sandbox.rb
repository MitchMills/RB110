def anagram_groups(words)
  groups = get_groups(words)
  groups.each { |group| p group }
end

def get_groups(words)
  groups = words.group_by { |word| word.chars.sort.join }
  groups.map(&:last).map(&:sort)
end
