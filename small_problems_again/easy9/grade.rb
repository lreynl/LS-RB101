=begin
def get_grade(gr1, gr2, gr3, ex_cred = 1)
  grade = (gr1 + gr2 + gr3) / 3 + ex_cred
  if grade <= 100 && grade >= 90
    'A'
  elsif grade < 90 && grade >= 80
    'B'
  elsif grade < 80 && grade >= 70
    'C'
  elsif grade < 70 && grade >= 60
    'D'
  else
    'F'
  end
end
=end
def get_grade(gr1, gr2, gr3, ex_cred = 0)
  grade = (gr1 + gr2 + gr3) / 3 + ex_cred
  case grade
  when (90..100) then 'A'
  when (80..89) then  'B'
  when (70..79) then  'C'
  when (60..69) then  'D'
  else                'F'
  end
end

p get_grade(95, 90, 93, 1) == "A"
p get_grade(81,82,83, 2) == 'B'
p get_grade(75,76,77) == 'C'
p get_grade(50, 50, 95) == "D"
