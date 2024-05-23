### EXAMPLE 6
```ruby
hash6 = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }]

hash6.select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```


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
