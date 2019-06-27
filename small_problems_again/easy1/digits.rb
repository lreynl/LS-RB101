def digits_list(num)
  return 'error!' if num < 0
  num.digits.reverse
end

p digits_list(12345)
p digits_list(0)
p digits_list(-987654)
