def reverse_num(num)
  num.to_s.reverse.to_i
end

p reverse_num(12345)
p reverse_num(9999991)
p reverse_num(100000)
p reverse_num(0)