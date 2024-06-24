def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  valid_triangle?(angles) ? type_of_triangle(angles) : :invalid
end

def valid_triangle?(angles)
  angles.sum == 180 && angles.min > 0
end

def type_of_triangle(angles)
  types = [:right, :obtuse, :acute]
  index = angles.max <=> 90
  types[index]
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
