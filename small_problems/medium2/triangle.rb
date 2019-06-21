def triangle_type(side1, side2, side3)
  if side1 == side2 && side1 == side3
    :equilateral
  elsif side1 == side2 || side1 == side3 || side2 == side3
    :isoceles
  else
    :scalene
  end
end

def valid_triangle?(side1, side2, side3)
  if side1 + side2 > side3 &&
     side1 + side3 > side2 &&
     side2 + side3 > side1
    return triangle_type(side1, side2, side3)
  end
  :invalid
end

p valid_triangle?(3, 3, 3)
p valid_triangle?(3, 3, 1.5)
p valid_triangle?(3, 4, 5)
p valid_triangle?(0, 3, 3)
p valid_triangle?(3, 1, 1)
p valid_triangle?(0, 0, 0)
