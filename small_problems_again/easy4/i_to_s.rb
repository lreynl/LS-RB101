def integer_to_string(int)
  return '0' if int.zero?
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

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'