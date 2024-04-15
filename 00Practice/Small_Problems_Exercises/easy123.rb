### WHAT'S MY BONUS?
=begin
Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

PROBLEM
input: integer, boolean
  - integer is positive
    - represents salary
  - boolean represents whether bonus will be paid
- output: integer
  - if boolean is true, return half of salary
  - else return 0

EXAMPLES

DATA STRUCTURES
- needs:
- input: integer, boolean

- output: integer

ALGORITHM
- if boolean is true
  - return salary / 2
- else return 0
=end

def calculate_bonus(salary, eligible_for_bonus)
  eligible_for_bonus ? (salary / 2) : 0
end

p calculate_bonus(2800, true) == 1400
p calculate_bonus(1000, false) == 0
p calculate_bonus(50000, true) == 25000
