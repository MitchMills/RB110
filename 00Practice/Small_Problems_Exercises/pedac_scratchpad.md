# PROBLEM
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

- input: array
  - contains integers
  - contains at least one number (no empty arrays)
- output: integer
  - sum of each leading subsequence of input array
    - subsequence always starts at first element
    - size of subsequence is from 1 up to size of input array
    - largest subsequence is full input array
    - number of subsequences = number of elements in input array

# EXAMPLES
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

# DATA STRUCTURES
input: array [3, 5, 2]
  - collection of all subsequences in array
    - [[3], [3, 5], [3, 5, 2]]
      - [3, 8, 10]
output: integer

# ALGORITHM
- iterate over a range from 1 up to the size of the input array
  - transform each number into a slice of the input array
    - start index is always 0
    - size of slice is current number in range
- iterate over array of subsequences
  - transform each subarray into its sum
- return sum of that array

# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM
