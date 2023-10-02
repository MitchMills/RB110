# PROBLEM
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

- input: integer
  - always odd
  - represents longest row in diamond

- output: strings
  - rows of asterixes in shape of diamond
    - longest row has same number of asterixes as input integer
    - row before and after has 2 less, etc.

# EXAMPLES
diamond(1)
*

diamond(3)
 *
***
 *

 diamond(9)
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

# DATA STRUCTURES
- integer
  - range array: 1..input integer stepping by 2
    - 9: [1, 3, 5, 7, 9]
- rows of strings

# ALGORITHM
- create an array of integers from 1 up to input integer, stepping by 2
- iterate over this range
  - print number of *s for current value
  - center these *s
    - either by calling .center
    - or by adding space: (input integer - current value) / 2
- remove the input integer from the array, and reverse it
- iterate over this range
  - print number of *s for current value

- [1, 3, 5, 7, 5, 3, 1]
- transform each element
  - if 1, then '*'.center(max_width)
  - else
    - '*' + (' ' * (row_width - 2)) + '*'

# # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # #

# PROBLEM


- input: 

- output:

# EXAMPLES


# DATA STRUCTURES


# ALGORITHM
