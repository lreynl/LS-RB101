def twice(num)
  len = num.to_s.length
  return num * 2 if len == 1
  return num if num.to_s[0..((len / 2) - 1)] == num.to_s[(len / 2)..-1]
  num * 2
end


p twice(7474)
p twice(111111)
p twice(889)
p twice(9990)
p twice(9)