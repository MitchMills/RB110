### basic
# def bubble_sort!(list)
#   loop do
#     no_swaps = true
#     no_swaps = one_pass(list, no_swaps)
#     break if no_swaps
#   end
#   list
# end

# def one_pass(list, no_swaps)
#   (0..(list.size - 2)).each do |index|
#     if list[index] > list[index + 1]
#       swap_elements!(list, index)
#       no_swaps = false
#     end
#   end
#   no_swaps
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

### optimized 1
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
#     (0..last_index).each do |index|
#       if list[index] > list[index + 1]
#         swap_elements!(list, index)
#         no_swaps = false
#       end
#     end
#   no_swaps
# end

# def swap_elements!(list, index)
#   list[index], list[index + 1] = list[index + 1], list[index]
# end

### optimized 2
def bubble_sort!(list)
  last_index = list.size - 1

  until last_index == 0
    last_swap = 0
    last_swap = one_pass(list, last_index, last_swap)
    last_index = last_swap
  end

  list
end

def one_pass(list, last_index, last_swap)
  (0..(last_index - 1)).each do |index|
    if list[index] > list[index + 1]
      swap_elements!(list, index)
      last_swap = index
    end
  end
  last_swap
end

def swap_elements!(list, index)
  list[index], list[index + 1] = list[index + 1], list[index]
end

array1 = [5, 3]
bubble_sort!(array1)
p array1 #== [3, 5]

array2 = [6, 2, 7, 1, 4]
bubble_sort!(array2)
p array2 #== [1, 2, 4, 6, 7]

array3 = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array3)
p array3 #== %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array4 = (0..9).to_a.reverse
bubble_sort!(array4)
p array4
