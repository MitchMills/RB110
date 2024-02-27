=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

PROBLEM
input: integer
  - represents the height and width of a triangle
output: strings
  - first string has one star, second has two, up to input integer: (1..n)
  - first string has (input integer - 1) spaces, then - 2, up to input integer: n - (1..n)
  - number of strings = input integer

EXAMPLES

DATA STRUCTURES
- input: integer
  - array of integers from 1 up to input integer
- output: strings

ALGORITHM
- create an array of numbers from 1 up to the input integer
- for each integer
  - output (input integer - number) spaces + number stars
=end

# def display_triangle(size, corner = 'lower right')
#   (1..size).each { |number| puts "#{' ' * (size - number)}#{'*' * number}" }
# end

def display_triangle(size, right_angle)
  vertical, horizontal = right_angle.split

  stars = (1..size).to_a
  stars.reverse! if vertical == 'upper'
  spaces = stars.map { |number| ' ' * (number - 1) }.reverse
  stars.map! { |number| '*' * number }

  order = [stars, spaces]
  order.reverse! if horizontal == 'right'
  lines = order.first.zip(order.last).map(&:join)
  puts lines
end

display_triangle(5, 'upper left')
display_triangle(5, 'upper right') #
display_triangle(5, 'lower left')
display_triangle(5, 'lower right') #
