def substrings(string)
  (0...string.size).flat_map do |start_index|
    leading_substrings(string[start_index..-1])
  end
end

def leading_substrings(string)
  (1..string.size).map { |size| string.chars.take(size).join }
end
