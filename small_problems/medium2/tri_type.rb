def triangle_type(angle1, angle2, angle3)
  if angle1.zero? || angle2.zero? || angle3.zero?
    :invalid
  elsif angle1 == 90 || angle2 == 90 || angle3 == 90
    :right
  elsif angle1 < 90 && angle2 < 90 && angle3 < 90
    :acute
  else
    :obtuse
  end
end
  
def valid_triangle?(angle1, angle2, angle3)
  if angle1 + angle2 + angle3 == 180
    return triangle_type(angle1, angle2, angle3)
  else
    :invalid
  end
end

p valid_triangle?(60, 70, 50)
p valid_triangle?(30, 90, 60)
p valid_triangle?(120, 50, 10)
p valid_triangle?(0, 90, 90)
p valid_triangle?(50, 50, 50)
p valid_triangle?(0, 0, 0,)
p valid_triangle?(180, 0, 0)
