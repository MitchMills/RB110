## Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

## PROBLEM
**Rules / Requirements**
- sequence of integers
  - all integers are even numbers
  - sequence begins with 2
  - sequence increases consecutively (2, 4, 6, 8, ...)
- sequence is grouped in rows
  - the 'number' of the row indicates how many integers are in that row
    - row 1 has one integer, row 2 has two integers, etc
- Input: a single integer
  - identifies a row number
- Output: a single integer
  - sum of all the integers in that row

- Sequence / Structure:
2, 4, 6, 8, 10, 12, 14, 16, 18, 20, . . .

Row 1: 2
Row 2: 4, 6
Row 3: 8, 10, 12
Row 4: 14, 16, 18, 20
....

**Questions**
- How do we create the structure?
  - Can't hardcode it; need to create it 'on the fly' after given the input integer
  - Note: we will take a "brute force" approach by building the array of rows up to the given row; we won't seek a mathematical/formula solution

## EXAMPLES
row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

## DATA STRUCTURES
- Overall structure represents an ordered sequence of integers
- Within that structure there is an ordered sequence of rows
- Each row contains an ordered sequence of integers

- Can use a nested array:
[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ...
]

    - Perhaps could use a hash?:
    {
      1 => [2],
      2 => [4, 6],
      3 => [8, 10, 12],
      4 => [14, 16, 18, 20],
      ...
    }
    - May give this a try after thoroughly exploring using nested array

## ALGORITHM

1. Create an empty 'all_rows' array to contain all the rows
2. Create a 'row' array and add it to the overall 'rows' array
    - see Step 2 Sub-Problem below
3. Repeat step 2 until all the necessary rows have been created
    - All rows have been created when the length of the 'all_rows' array equals the input integer
4. Sum the final row
5. Return the sum 

  **Step 2 Sub-Problem**
  *Problem: Create a Row*
    Rules:
    - Row is an array
    - Array contains integers
    - Integers are consecutive even numbers
    - Integers in each row form part of an overall larger sequence
    - Rows are of different lengths
    - INPUT: all the information needed to create the output
      - the starting integer for that row
      - the length of the row
    - OUTPUT: the row itself: e.g. `[8, 10, 12 ]`

    Examples:
    starting integer: 2, length: 1 --> `[2]`
    starting integer: 4, length: 2 --> `[4, 6]`
    starting integer: 8, length: 3 --> `[8, 10, 12]`

    Data Structures:
    - An array of integers

    Algorithm:
    1. Create an empty array 'row' to contain the integers
    2. Add the starting integer to the 'row' array
    3. Increment the starting integer by 2 to get the next integer in the sequence
    4. Repeat steps 2 and 3 until the array has reached the correct length
        - The correct length of the array is equal to the input integer
    5. Return the 'row' array

## CODE
  - See sum_even_rows.rb
  