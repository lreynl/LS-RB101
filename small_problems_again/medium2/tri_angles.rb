def valid?(angles)
  angles.sum == 180 &&
  angles.none? { |angle| angle.zero? || angle == 180 }
end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  return :invalid unless valid?(angles)
  case
  when angles.include?(90)                then :right
  when angles.all? { |angle| angle < 90 } then :acute
  when angles.any? { |angle| angle > 90 } then :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid