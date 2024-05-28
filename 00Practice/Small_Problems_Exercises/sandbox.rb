def anagram_groups(words)
  groups = get_groups(words)
  display_groups(groups)
end

def get_groups(words)
  combos = words.map { |word| word.chars.sort }.uniq
  combos.map do |combo|
    words.select { |word| word.chars.sort == combo }.sort
  end
end

def display_groups(groups)
  groups.each { |group| p group }
end

words = [
  'demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live', 'fowl', 'veil',
  'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon'
]

anagram_groups(words)
