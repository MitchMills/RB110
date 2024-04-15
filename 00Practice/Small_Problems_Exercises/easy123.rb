### 6 RIGHT TRIANGLES
=begin
Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

PROBLEM
input: integer
  - positive
  - represents length of each side of a right triangle

output: lines of strings
  - represent a right triangle
  - composed of '*'s
  - hypotenuse is from lower-left to upper-right
  - first line has 1 *, second has 2, up to input integer
  - input integer = number of stars in bottom line of triangle

EXAMPLES

DATA STRUCTURES
- needs:
  - control how many lines are printed
  - control how many spaces and stars are on each line

- input: integer
  - range (from 1 up to input integer)
  - array of strings
- output: lines of strings

ALGORITHM
- create an array, size  is input integer
- fill array with strings
  - spaces: input integer minus current number
  - stars: current number
- output array to terminal
=end

def triangle(size, right_angle = 'lower right')
  triangle = create_triangle(size, right_angle)
  puts triangle
end

def create_triangle(size, right_angle)
  triangle = Array.new(size) { |index| '*' * (index + 1) }
  rotate_triangle(triangle, right_angle)
end

def rotate_triangle(triangle, right_angle)
  width = triangle.size
  vertical, horizontal = right_angle.split
  triangle.reverse! if vertical == 'upper'
  triangle.map do |row|
    horizontal == 'right' ? row.rjust(width) : row.ljust(width)
  end
end

triangle(5, 'lower right')
triangle(5, 'lower left')
triangle(5, 'upper right')
triangle(5, 'upper left')
