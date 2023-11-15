### PROBLEM 1
def hasherize(array)
  array.each_index.with_object({}) do |index, hash|
    current_key = array[index]
    hash[current_key] = index
  end
end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p hasherize(flintstones)
