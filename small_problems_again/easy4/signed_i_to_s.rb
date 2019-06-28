def integer_to_string(int)
  return '0' if int.zero?
  int *= -1 if int < 0
  vals = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
           7 => '7', 8 => '8', 9 => '9' }
           
  result = ''
  while int > 0
    num = int % 10.0
    result << num.round.to_s
    int /= 10.0
    int = int.floor
  end
  result.reverse
end

def signed_integer_to_string(int)
  num = integer_to_string(int)
  to_prepend = if int > 0
                 '+'
               elsif int < 0
                 '-'
               else
                 ''
               end
  num.prepend(to_prepend)  
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'