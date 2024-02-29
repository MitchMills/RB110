def display_triangle(size, right_angle)
  vertical, horizontal = right_angle.split

  lines = (1..size).to_a
  stars = lines.map { |reps| '*' * reps }
  spaces = lines.map { |reps| ' ' * (reps - 1) }.reverse
  triangle = stars.zip(spaces).map(&:join)

  triangle.reverse! if vertical == 'upper'
  triangle.map!(&:reverse) if horizontal == 'right'
  puts triangle
end

# tests
display_triangle(5, 'upper left')
display_triangle(5, 'upper right')
display_triangle(5, 'lower left')
display_triangle(5, 'lower right')
