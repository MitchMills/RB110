## PROBLEM
- input: integer
  - represents row number
- output: integer
  -represents sum of all numbers in that row number

  # Rules
  - each row has the same number of integers as the row number
    - row 1 has 1 integer, row 2 has 2, etc
  - numbers are even integers
  - numbers are in ascending order, starting from 2: 2, 4, 6, 8 ...
  - first number of a row == last number of previous row + 2

## EXAMPLES
1:   2               => 2
2:   4  6            => 10
3:   8 10 12         => 30
4:  14 16 18 20      => 68
5:  22 24 26 28 30   => 130

## DATA STRUCTURES
- nested array:
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20]
]

## ALGORITHM
- set `row_length` to 1
- set `start_number` to 2
- create `current_row`
  - set `current_row` to a new empty array
  - add `start_number` to `current_row`
  - add successive numbers, incremented by 2, to `current_row`
  - stop when `current_row` length == `row_length`
  - if `row_length` == `row_number` (input integer), return sum of `current_row`
  - else, set `start_number` to equal last number of `current_row` + 2
  - increment `row_length` by 1
  - repeat
  
