# What happens is this code? Include in your explanation what is happening at each level of iteration,
# what each method does with the return value of the block,
# what the method itself returns, and
# what is ultimately returned by the initial method call.
# What does this demonstrate?

# letters = [{a: ['a', 'aa', 'aaa']},
#        {b: ['b', 'ba', 'bba'], c: ['c', 'caa'], d: ['d']},
#        {e: ['e'], f: ['f', 'faa']}]

# result = letters.select do |hash|
#   hash.all? do |_letter, strings|
#     strings.all? { |string| string.count('a').odd? }
#   end
# end

# p result

=begin 1:03
In this code snippet, local variable `letters` is initialized on line 7 and assigned to an array object which contains three elements. Each of those elements is a hash object, and each hash object contains one or more key-value pairs, where the keys are symbols, and the values are arrays containing one or more string objects as elements.

On line 11, local variable `result` is initialized and is assigned to the return value of the code on lines 11 to 13.

On line 11, the `Array#select` method is called on `letters`. The `#select` method iterates over the calling array, and passes each element into the block as an argument in turn. `#select` will return a new array, whose elements will consist of the elements of the calling array for which the block returns a truthy value.

As each element of `letters` is passed into the block, that value is bound to the block variable `hash`. Inside the block, the `Enumberable#all?` method is called on `hash`. `#all?` passes each key-value pair of the calling hash into the block. If the block returns a truthy value for every key-value pair in the calling hash, `#all?` will return `true`. Otherwise it will stop iterating and return `false` as soon as the block returns a falsey value.

As each key-value pair of `hash` is passed into the block, the key and value are bound to local variables `letter` and `_strings`, respectively. Inside this block, the `Array#all?` method is called on `strings`. `#all?` passes each element of the calling array into the block. If the block returns a truthy value for every element of the calling array, `#all?` will return `true`. Otherwise it will return false and cease iterating as soon as the block returns a falsey value.

As each element of `strings` is passed into the block, it is bound to local variable `string`. Within this block, the `String#count` method is invoked on `string`, with the string object `a` as an argument. The `#count` method returns an integer representing the number of times that the argument appears in the calling string. The `Integer#odd?` method is called on this return value, and will return `true` if the integer is odd, and `false` otherwise.

Every hash element passed into the `Array#select` block contains at least one string element within its value array that has a non-odd number of occurences of the string `'a'` within it. That will cause the call to `String#all?` on line 13 to return `false`, which will cause the call to `Enumerable#all?` on line 12 to return `false`, which means that the array returned by `Array#select` will be empty, since its block does not return a truthy value for any of the passed in hash elements.

So `result` is initialized to a value of `[]` on line 11. When the `Kernel#p` method is invoked on line 17, with the value referenced by `result` passed in as an argument, it will print that value, `[]`, to the terminal.
=end

## Changing the code
letters = [{a: ['a', 'aa', 'aaa']},
       {b: ['b', 'ba', 'bba'], c: ['c', 'caa'], d: ['d']},
       {e: ['e'], f: ['f', 'faa']}]

result = letters.map do |hash|
  hash.select do |_letter, strings|
    strings.any? { |string| string.count('a').odd? }
  end
end

p result

=begin
In this code, `Array#map` is called on `letters` on line 42. `#map` passes each element of the calling array into the block in turn, and returns a new array with the same number of elements. The elements of the new array are determined by the return value of the block.

As each hash element of `letters` is passed into the block by `#map`, it is bound to local variable `hash`. Inside the block, `Enumberable#select` is called on `hash`. `#select` passes each key-value pair of the hash object referenced by `hash` into its block and will return a new array populated by those key-value pairs for which the block returns a truthy value.

As each key and value pair is passed into the `#select` block, they are bound to local variables `_letter` and `strings` respectively. Within the `#select` block, the `Array#any?` method is called on `strings`. This method passes each element of the calling array into its block in turn, and will return `true` as soon as the block returns a truthy value. If the block does not return a truthy value for any of the elements of `strings` passed in, `#any?` will return `false`.

As each string element of `strings` is passed into the `#any?` block, it is bound to local variable `string`. Within this block, the `String#count` method is called on `string`, with `'a'` as an argument. The `#count` method will return an integer representing the number of times the argument appears within the calling string. The `Integer#odd?` method is then called on this return value, and will return `true` if the integer is odd, and `false` otherwise.
=end
