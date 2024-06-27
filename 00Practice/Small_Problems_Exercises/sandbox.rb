### basic algorithm
# def bubble_sort!(list)
#   loop do
#     no_swaps = true
#     no_swaps = one_pass(list, no_swaps)
#     break if no_swaps
#   end
#   list
# end

# def one_pass(list, no_swaps)
#   (0..(list.size - 2)).each do |current_index|
#     if list[current_index] > list[current_index + 1]
#       swap_elements!(list, current_index)
#       no_swaps = false
#     end
#   end
#   no_swaps
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

### first optimization
# def bubble_sort!(list)
#   offset = 2

#   loop do
#     no_swaps = true
#     no_swaps = one_pass(list, offset, no_swaps)
#     break if no_swaps
#     offset += 1
#   end

#   list
# end

# def one_pass(list, offset, no_swaps)
#   last_index = list.size - offset
#   (0..last_index).each do |current_index|
#     if list[current_index] > list[current_index + 1]
#       swap_elements!(list, current_index)
#       no_swaps = false
#     end
#   end
#   no_swaps
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

### second optimization
# def bubble_sort!(list)
#   last_index = list.size - 1

#   until last_index.zero?
#     last_swap = 0
#     last_swap = one_pass(list, last_index, last_swap)
#     last_index = last_swap
#   end

#   list
# end

# def one_pass(list, last_index, last_swap)
#   (0..(last_index - 1)).each do |current_index|
#     if list[current_index] > list[current_index + 1]
#       swap_elements!(list, current_index)
#       last_swap = current_index
#     end
#   end
#   last_swap
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

# # # # # # # # # # # # # # # # # # # #

##### basic algorithm
# def bubble_sort!(list)
#   no_swaps = false
#   until no_swaps
#     no_swaps = one_pass(list, no_swaps)
#   end
# end

# def one_pass(list, no_swaps)
#   no_swaps = true
#   list.each_cons(2).with_index do |(element1, element2), index|
#     if element1 > element2
#       swap_elements!(list, index)
#       no_swaps = false
#     end
#   end
#   no_swaps
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

##### first optimization
def bubble_sort!(list)
  no_swaps = false

  (1..list.size).each do |offset|
    break if no_swaps
    no_swaps = one_pass(list, offset, no_swaps)
  end

  nil
end

def one_pass(list, offset, no_swaps)
  no_swaps = true
  last_index = list.size - offset

  (0..last_index).each_cons(2) do |index1, index2|
    if list[index1] > list[index2]
      swap_elements!(list, index1)
      no_swaps = false
    end
  end

  no_swaps
end

def swap_elements!(list, index)
  list[index], list[index + 1] = list[index + 1], list[index]
end

##### second optimization


##### TESTS
array = [1, 2, 3, 4, 5]
p bubble_sort!(array)
p array
puts

array1 = [5, 3]
bubble_sort!(array1)
p array1 #== [3, 5]
puts

array2 = [6, 2, 7, 1, 4, 6, 2, 7, 1, 4]
bubble_sort!(array2)
p array2 #== [1, 2, 4, 6, 7]
puts

array3 = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array3)
p array3 #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts

array4 = (0..9).to_a.reverse + (0..9).to_a
bubble_sort!(array4)
p array4
