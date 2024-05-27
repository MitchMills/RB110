def sequence1(size, multiple)
  return Array.new(size, multiple) if multiple == 0
  multiple.step(by: multiple, to: multiple * size).to_a
end

def sequence2(size, multiple)
  return Array.new(size, multiple) if multiple == 0
  Array((multiple..(multiple * size)).step(multiple))
end
