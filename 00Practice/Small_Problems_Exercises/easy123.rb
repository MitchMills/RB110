=begin 8:36
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

PROBLEM
input: integer
  - represents a year
output: boolean
  - true if input year is a leap year, false otherwise
  - leap year
    - evenly divisible by 4
      - unless also evenly divisible by 100
        - not a leap year unless also evenly divisible by 400

EXAMPLES

DATA STRUCTURES
- needs
  - leap year logic
    - year % 400 == 0 &&
    - year % 100 == 0 &&
    - year % 4 == 0

ALGORITHM
- if evenly divisible by 4
  - if yes, check if evenly divisible by 100
    - if yes, check if evenly divisible by 400
      - if yes, true
    - if no, false
  - if no, then true
- if no, then false
=end

# def leap_year?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       if year % 400 == 0
#         true
#       else
#         false
#       end
#     else
#       true
#     end
#   else
#     false
#   end
# end

# def leap_year?(year)
#   year % 4 == 0 ? check_exceptions(year) : false
# end

# def check_exceptions(year)
#   year % 100 == 0 ? year % 400 == 0 : true
# end

def leap_year?(year)
  # year % 4 == 0 && year % 100 != 0 ? true : year % 400 == 0
  # year % 4 == 0 ? year % 100 != 0 || year % 400 == 0 : false
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
