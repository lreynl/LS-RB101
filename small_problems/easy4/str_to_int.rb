STR_INT = { '1' => 1,
            '2' => 2,
            '3' => 3,
            '4' => 4,
            '5' => 5,
            '6' => 6,
            '7' => 7,
            '8' => 8,
            '9' => 9,
            '0' => 0,
            '-' => -1,
            '+' => 1 }
            
def str_to_int(str)
  str = str.split('').reverse
  num = 0
  power = 0
  str.each do |digit|
    if digit == '-' || digit == '+'
      num *= STR_INT[digit]
    else
      STR_INT[digit].times { num += 10**power }
      power += 1
    end
  end
  num
end

#def str_to_int(str)
#  str = str.split('').reverse
#  num = 0
#  power = 0
#  str.each do |digit|
#    STR_INT[digit.downcase].times { num += 16**power }
#    power += 1
#  end
#  num
#end

p str_to_int('-12345')
p str_to_int('99090')
p str_to_int('-1')
p str_to_int('+8888')