### EXAMPLE 2
```ruby

```


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
On line 2 local variable `array1` is initialized to the nested array `[[1, 2], [3, 4]]`.

On line 4 the `Array#each` method is called on `array1`, and each element of `array1` is passed in to the block in turn and assigned to local variable `arr`.

Within the block, on each iteration the `Array#first` method is called on `arr`. It returns the element at index 0 of the current inner array assigned to `arr`. So it will return the integers `1` and `3` respectively. This value is passed to the `Kernel#puts` method, which outputs a string representation of the integer and returns `nil`.

This is the last evaluated statement within the block, so the return value of the block is `nil`. The `each` method does not use this return value. It returns the calling object, the array `[[1, 2], [3, 4]]`.

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

Act Object Effect Return Use

All Our Efforts Reduce Umbrage

aoservu
