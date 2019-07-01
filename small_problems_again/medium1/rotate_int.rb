def int_rotate(int)
  int = int.to_s
  return int.to_i if int.length == 1
  (int[1..-1] + int[0]).to_i
end

p int_rotate(12345)
p int_rotate(0000)
p int_rotate(991)