def valid?(sides)
  p sides
  (sides[2] < sides[0] + sides[1]) && !sides[0].zero? && !sides[1].zero? && !sides[2].zero?
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  sides.sort!
  if !valid?(sides)
    return :invalid
  elsif sides[0] == sides[1] && sides[0] == sides[2]
    :equilateral
  elsif (sides[0] == sides[1] && sides[0] != sides[2]) ||
        (sides[1] == sides[2] && sides[0] != sides[1])
    :isosceles
  elsif sides[0] != sides[1] && sides[0] != sides[2]
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
p triangle(5,9,5) == :isosceles
p triangle(99,0,99) == :invalid