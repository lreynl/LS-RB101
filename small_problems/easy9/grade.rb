def get_grade(first, second, third)
  average = (first + second + third) / 3.0
  case
  when average >= 90
    'A'
  when average >= 80 && average < 90
    'B'
  when average >= 70 && average < 80
    'C'
  when average >= 60 && average < 70
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95)