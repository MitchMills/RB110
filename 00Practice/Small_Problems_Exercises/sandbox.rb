##### basic algorithm
def bubble_sort!(list)
  no_swaps = false

  until no_swaps
    no_swaps = one_pass(list, no_swaps)
  end
end

def one_pass(list, no_swaps)
  no_swaps = true

  list.each_cons(2).with_index do |pair, index|
    if pair.first > pair.last
      swap_elements!(list, index)
      no_swaps = false
    end
  end

  no_swaps
end

def swap_elements!(list, index)
  list[index], list[index.next] = list[index.next], list[index]
end

##### first optimization
def bubble_sort!(list)
  no_swaps = false
  final_index = list.size - 1

  final_index.downto(0).each do |last_index|
    break if no_swaps
    no_swaps = one_pass(list, last_index, no_swaps)
  end

  nil
end

def one_pass(list, last_index, no_swaps)
  no_swaps = true

  (0..last_index).each_cons(2) do |index_pair|
    if list[index_pair.first] > list[index_pair.last]
      swap_elements!(list, index_pair.first)
      no_swaps = false
    end
  end

  no_swaps
end

def swap_elements!(list, index)
  list[index], list[index.next] = list[index.next], list[index]
end

##### second optimization
def bubble_sort!(list)
  last_index = list.size - 1

  until last_index.zero?
    last_swap = 0
    last_swap = one_pass(list, last_index, last_swap)
    last_index = last_swap
  end
end

def one_pass(list, last_index, last_swap)
  (0..last_index).each_cons(2) do |index_pair|
    if list[index_pair.first] > list[index_pair.last]
      swap_elements!(list, index_pair.first)
      last_swap = index_pair.first
    end
  end

  last_swap
end

def swap_elements!(list, index)
  list[index], list[index.next] = list[index.next], list[index]
end

##### TESTS
array = [1, 2, 3, 4, 5]
p bubble_sort!(array)
p array
puts

array1 = [5, 3]
p bubble_sort!(array1)
p array1 #== [3, 5]
puts

array2 = [6, 2, 7, 1, 4, 1, 2, 4, 6, 7]
p bubble_sort!(array2)
p array2 #== [1, 2, 4, 6, 7]
puts

array3 = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array3)
p array3 #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts

array4 = (0..9).to_a.reverse + (0..9).to_a
p bubble_sort!(array4)
p array4
