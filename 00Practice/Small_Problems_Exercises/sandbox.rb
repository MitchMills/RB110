def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  valid_triangle?(sides) ? triangle_type(sides) : :invalid
end

def valid_triangle?(sides)
  sides.min(2).sum > sides.max
end

# def triangle_type(sides)
#   # number_of_equal_sides = sides.count(sides.first)
#   number_of_equal_sides = sides.tally.values.max
#   case number_of_equal_sides
#   when 3 then :equilateral
#   when 2 then :isosceles
#   when 1 then :scalene
#   end
# end

# def triangle_type(sides)
#   types = %i(isosceles scalene equilateral)
#   number_of_equal_sides = sides.count(sides.first)
#   index = 2 <=> number_of_equal_sides
#   types[index]
# end

def triangle_type(sides)
  types = %i(zero scalene isosceles equilateral)
  number_of_equal_sides = sides.count(sides.first)
  types[number_of_equal_sides]
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
