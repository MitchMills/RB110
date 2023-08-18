## Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

## PROBLEM
**Rules / Requirements**
- sequence of integers
  - integers are consecutive
  - integers are even numbers
  - first integer in sequence is 2
  - sequence increases consecutively (2, 4, 6, 8, . . .)

- integers are grouped into a series of rows
  - succesive rows increase in size incrementally
  - the number of the row indicates how many integers are in that row
    - i.e first row has 1 integer, second row has 2 integers, etc
              
- INPUT: integer
  - represents the number of a row in the sequence
- OUTPUT: integer
  - the sum of all the numbers in that row

**Sequence / Structure**
- 2, 4, 6, 8, 10, 12, 14, 16, 18, 20 . . .

- Row one:    2
- Row two:    4, 6
- Row three:  8, 10, 12
- Row four:   14, 16, 18, 20

**Questions**
- Can the solution be mathematical / use a formula, or should we use "brute force" to create the entire sequence up to the given row? BRUTE FORCE
- Can't hard code the structure: how to create the sequence / structure "on the fly"?

## EXAMPLES
row number: 1 --> sum of integers: 2
row number: 2 --> sum of integers: 10
row number: 3 --> sum of integers: 30
row number: 4 --> sum of integers: 68

## DATA STUCTURE(S)
- Overall structure is an ordered sequence of even integers
- Within that sequence is an ordered sequence of rows
- Within each row is an ordered subset of the overall sequence

- A nested array seems the obvious choice:
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  . . .
]

## ALGORITHM
1. Create an empty array 'all_rows'
2. Create an array 'current_row' and add it to all_rows *See Sub-Problem below*
3. Repeat step 2 until all necessary rows have been created
    - The number of necessary rows equals the input integer
4. Get the last row and sum the numbers in it
5. Return the sum

**Steps 2 & 3 Sub-Problem**
  *Problem: Create a row*
    Rules:
      - row is an array
      - array contains integers
      - integers are consecutive even numbers
      - integers in row are part of a larger overall sequence
      - rows are different lengths
      - each successive row is 1 longer than the preceding row
      - INPUT: to create a row, we need:
          - the length of that row (integer)
          - the starting integer for that row (integer)
      - OUTPUT: the row itself (array)

  *Examples:*
    row length: 1, starting integer: 2 --> `[2]`
    row length: 2, starting integer: 4 --> `[4, 6]`
    row length: 3, starting integer: 8 --> `[8, 10, 12]`
    row length: 4, starting integer: 14 --> `[14, 16, 18, 20]`

  *Data Structure(s):* array of integers

  *Algorithm:*
    1. Create an empty array 'current_row'
    2. Add starting integer to current_row array
    3. Increment starting integer by 2 to get next number in the sequence
    4. Repeat steps 2 and 3 until array has reached the correct length
        - correct length is equal to the passed in row length integer
    5. Return current_row array
