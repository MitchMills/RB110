### EXAMPLE 8
```ruby
array8 = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]

array8.map do |sub_array|
  sub_array.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]
```




### EXAMPLE 7
```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

arr.sort_by do |sub_arr|
  sub_arr.map { |num| num.to_i }
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```
`Array#sort_by` is called on `arr`, and each subarray element is passed to the block in turn and assigned to local variable `sub_arr`. Within the block, `Array#map` is called on `sub_arr` on each iteration of the outer block and returns a new array with elements determined by the return value of the `#map` block. The `#map` block calls `String#to_i` on each subarray string element passed in, so the call to `#map` returns a new array of integers. The `#sort_by` block uses this return value to place the elements of `arr` in order by comparing the integer values of each string in the subarrays. `#sort_by` returns a new array. The original array is unchanged.



****
On line 3, local variable `arr` is initialized and assigned to an array. Each element of the array is a subarray, and each element these subarrays is a string.

On line 5, the `Array#sort_by` method is called on `arr`. Each subarray element of `arr` is passed in to the block in turn and assigned to local variable `sub_arr`. On line 6 the `Array#map` method is called on `sub_arr`, and each element of the current subarray is passed in to the `#map` block in turn and assigned to local variable `num`.

Within the `#map` block, the `String#to_i` method is called on `num`. This method returns the string value interpreted as an integer. This is the last evaluated expression of the `#map` block, so this value is also what the `#map` block itself returns. `#map` returns a new array whose elements are the return values from the block.

The call to `#map` is the last evaluated expression in the `#sort_by` block, so the new array returned by `#map` is the return value of that block. `#sort_by` uses that return value to sort the elements of the calling array `arr`. The result is a new array with the subarray elements sorted by the numerical value of the string elements in each subarray. So this code returns a new array with the value `[["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]`

### EXAMPLE 6
```ruby
array6 = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]

array6.select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```
On line 3, local variable `array6` is initialized to an array with the value `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`. On line 5 the `Array#select` method is called on `array6`. Each hash element in `array6` is passed to the block in turn and assigned to local variable `hash`.

Within the block passed to `#select`, the `Enumerable#all?` method is called on `hash`, and each key-value pair of the current hash is passed to `#all?`'s block and assigned to local variables `key` and `value` respectively.

Within `#all`'s block, the `String#[]` method is called on `value`, with `0` as an argument. This expression returns a new string with the same value as the character at index 0 of the string assigned to `value`. The `Symbol#to_s` method is called on `key`, which returns a string representation of the current key.

These two return values are then compared to each other using the `String#==` method. It will return `true` if they have the same value, and `false` otherwise.

Since this is the last evaluated expression within this block, the return value of this comparison will also be the return value of the block itself. `#all?` uses the return value of the block to determine its own return value. `#all?` will return `true` if its block returns a truthy value for every key-value pair of `hash` passed into it. It will return `false` otherwise.

The `#all?` method call is the last evaluated expression within the block passed to `#select`, so that return value will also be the return value of the `#select` block. `#select` uses this return value to determine whether to include the current hash in the new array it returns. If the return value of the block is truthy, the current element will be included in the new hash. Otherwise the current element will be excluded.

The return value of this code will be `[{ c: 'cat' }]`, since that hash is the only element in the input array where for every key-value pair, the first character of the value matches the string version of the key.



### EXAMPLE 5
```ruby
array5 = [[1, 2], [3, 4]]

array5.map do |arr|
  arr.map do |num|
    num * 2
  end
end
```
On line 3, local variable `array5` is initialized to an array with a value of `[[1, 2], [3, 4]]`. On line 5, the `Array#map` method is called on `array5`, and each inner array element is passed in to the block in turn and assigned to local variable `arr`.

Within this outer block, `Array#map` is called on `arr` and each integer element of the current array is passed into the inner block in turn, and assigned to local variable `num`.

Within the inner block, the `Integer#*` method is called on `num` with `2` passed in as an argument. The return value of this expression will be twice the value of the current integer assigned to `num`. This is the last evaluated expression in the inner block, so it is the return value of that block, and the inner call to `map` will use it to transform each integer element of the current array.

The return value of the inner call to `map` is the last evaluated expression of the outer block, so it will be the return value of that block. The outer call to `map` will use it to transform each inner array passed in to the outer block by the outer call to `map`.

This code will return a new array with the value `[[2, 4],[6, 8]]`.


### EXAMPLE 4
```ruby
array4 = [[18, 7], [3, 12]]
my_arr = array4.each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
```
On line 3, local variable `array4` is initialized to an array with the value `[[18, 7], [3, 12]]`.

On line 4, local variable `my_arr` is initialized to the return value of the `Array#each` method called on `array4`. Each inner array of `array4` is passed in to the block in turn and assigned to local variable `arr`.

Inside the block, on line 5 `Array#each` is called on `arr`, and each element of the current inner array is passed into the block in turn and assigned to local variable `num`. 

Within this block, on line 6 the current value referenced by `num` is compared to `5`. The comparison will return `true` if that value is greater than `5`, and `false` otherwise. This boolean return value will be used by the `if` conditional on line 6.

If the value is `true`, line 7 will execute. Otherwise the conditional statement will terminate and return `nil`.

If line 7 executes, the `Kernel#puts` will be called on `num`. This will output a string representation of the value referenced by `num` to the terminal and will return `nil`. Since this will be the last evaluated expression within the conditional statement, the conditional statement will return `nil`.

Since the conditional is the last evaluated expression within this block, and `nil` is returned whichever way the conditional evaluates, the block will return `nil`. The return value of this block is not used by `each`, which returns the calling object, in this case the value referenced by `arr`, i.e. each inner array of `array4`.

The inner call to `each` is the last evaluated expression in the block of the outer call to `each`, so the return value of the outer call's block is also the value referenced by `arr`. This return value of the block is not used by `each`, which returns its calling object, the array referenced by `array4`.

It is this return value that is assigned to local variable `my_arr` on line 4, so `my_array` references the same object as `array4`, namely an array with a value of `[[18, 7], [3, 12]]`.

### EXAMPLE 3
```ruby
array3 = [[1, 2], [3, 4]]
array3.map do |arr|
  puts arr.first
  arr.first
end
```
On line 3 local variable `array3` is intialized to an array with the value `[[1, 2], [3, 4]]`.

On line 4, the `Array#map` method is called on `array3`. Each inner array element of `array3` is passed into the block in turn, and assigned to local variable `arr`.

Within the block, on line 5 the `Array#first` method is called on `arr`, which returns the element at index 0 of the current array, in this case the integers `1` and `3`, respectively . This value is then passed to the `Kernel#puts` method, which outputs a string representation of the integer to the terminal and returns `nil`.

On line 6, the `Array#first` method is again called on `arr`, and again returns the element at index 0 of the current array. Since this is the last evaluated expression of the block, the block returns `1` on the first iteration and `3` on the second.

These return values are used by `map` to perform transformation, replacing each inner array with the returned integer, so the return value of this call to `map` is `[1, 3]`

### EXAMPLE 2
```ruby
array2 = [[1, 2], [3, 4]]
array2.map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```
On line 3 local variable `array2` is initialized to an array with the value `[[1, 2], [3, 4]]`.

On line 4 the `Array#map` method is called on `array2`. Each inner array is passed into the block in turn and assigned to local variable `arr`. Within the block, on line 5 the `Array#first` method is called on `arr`, which returns the element at index 0 of the current array. In this case the integers `1` and `3` are returned on successive iterations.

These return values are then passed to the `Kernel#puts` method, which outputs a string representation of each integer to the terminal. `puts` returns `nil`, and since this is the last evaluated expression in the block, the block returns `nil`. `map` returns a new array with each element determined by the return value of the block, so the return value of this call to `map` is the array `[nil, nil]`.

### EXAMPLE 1
```ruby
array1 = [[1, 2], [3, 4]]

array1.each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```
On line 9 local variable `array1` is initialized to a nested array with the value `[[1, 2], [3, 4]]`.

On line 11, the `Array#each` method is called on `array1`. Each inner array element of `array1` is passed into the block in turn, and assigned to local variable `arr`. Within the block, on line 12 the `Array#first` method is called on `arr`, which returns the element at index 0 of the current array, in this case the integers `1` and `3` respectively. 

This value is passed to the `Kernel#puts` method, which outputs a string representation of the integer to the terminal, and returns `nil`. Since this is the last evaluated statement in the block, the block returns `nil`. This return value is not used by `Array#each`. `each` returns the calling object, `[[1, 2], [3, 4]]`.

#####

- What is the TYPE OF ACTION being performed (method call, block, conditional, etc..)?
- What is the OBJECT that action is being performed on?
- What is the SIDE EFFECT of that action (e.g. output or destructive action)?
- What is the RETURN VALUE of that action?
- Is the return value USED by whatever instigated the action?

ACTION
OBJECT
SIDE EFFECT
RETURN VALUE
USED

Act Object Effect Value Use

All Our Efforts Victimize Undead
AOEVU
aoservu
