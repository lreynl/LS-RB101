def int_rotate(str)
  return str if str.length == 1
  str[1..-1] << str[0]
end

def rotate_rightmost_digits(int, num)
  if int.length == num
    int_rotate(int)
  else
    (int[0..(int.length - num - 1)] +
     int_rotate(int[(int.length - num)..-1]))
  end
end

def max_rotation(num)
  num = num.to_s
  len = num.length
  len.downto(1) { |index| num = rotate_rightmost_digits(num, index) }
  num.to_i
end

p  max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
