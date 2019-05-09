def xor(p, q)
  (p && !q) || (!p && q)
end

p xor(true, false)
p xor(4.even?, 6.even?)
p xor(9.even?, 11.even?)
p xor(7 == 7, 6 == 7)