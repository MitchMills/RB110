def letter_count(string)
  letters = string.chars.sort

  letters.each_with_object(Hash.new(0)) do |letter, counts|
    counts[letter.to_sym] += 1
  end
end

p letter_count('codewars') == { :a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1 }
p letter_count('activity') == { :a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1 }
p letter_count('arithmetics') == { :a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2 }
