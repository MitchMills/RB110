def bubble_sort!(list)
  last_index = list.size - 2
  last_swap = 0

  loop do

    (0..last_index).each do |index|
      if list[index] > list[index + 1]
        list[index], list[index + 1] = list[index + 1], list[index]
        last_swap = index
      end
    end

    break if last_swap <= 1
    last_index = last_swap
  end

  list
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
