def fib_rec_tail(num, sum1, sum2)
  return sum1 if num == 1
  return sum2 if num == 2
  fib_rec_tail(num - 1, sum2, sum2 + sum1)
end

def fib_rec(num)
  fib_rec_tail(num, 1, 1)
end

puts fib_rec(30)
puts fib_rec(50)
puts fib_rec(100)