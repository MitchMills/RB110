def bubble_sort!(array)
  until array.each_cons(2).all? { |ele1, ele2| ele2 > ele1 }
    array.each_cons(2).with_index do |(ele1, ele2), idx|
      array[idx], array[idx + 1] = array[idx + 1], array[idx] if ele1 > ele2
    end
  end
end

array1 = [5, 3]
bubble_sort!(array1)
p array1 == [3, 5]

array2 = [6, 2, 7, 1, 4]
bubble_sort!(array2)
p array2 == [1, 2, 4, 6, 7]

array3 = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array3)
p array3 == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
