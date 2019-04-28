def some_args(a, b, c, d=1, e=2, f=3, g=4, h=5, i=6, j, k, l)
  p [a, b, c, d, e, f, g, h, i, j, k, l]
end

def two_args(a, b=1, c=2, d)
  p [a, b, c, d]
end

some_args(100, 101, 102, 103, 104, 105, 106) #prints [100, 101, 102, 103, 2, 3, 4, 5, 6, 104, 105, 106]
two_args(98, 99) #prints [98, 1, 2, 99]
