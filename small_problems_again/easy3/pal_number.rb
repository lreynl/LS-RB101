def pal_num?(num)
  num = num.to_s
  num == num.reverse
end

p pal_num?(1234321)
p pal_num?(5454)
p pal_num?(5432345)
p pal_num?(0001000)