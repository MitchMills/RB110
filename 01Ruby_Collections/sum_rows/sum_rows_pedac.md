## PROBLEM
- input: integer
  - represents row number
- output: integer
  -represent sum of all numbers in that row number

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
1. create empty `rows` array
2. (add `row_number` rows to `rows` array)
3. sum last row of `rows` array
4. return sum

  2. add`row_number` rows to `rows array`
    1. create a row
      - create an empty row
        - add start integer to row
        - increment start integer by 2
        - repeat until sub-array length == row number
    2. add row to `rows` array
    3. repeat until `rows` length = `row_number`
