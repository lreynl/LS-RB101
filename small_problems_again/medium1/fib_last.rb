def fib_last(nth)
  a = 0
  b = 1
  fib = 1
  counter = 1
  until counter == nth-1
    a = b
    b = fib
    fib = (a + b) % 10
    counter += 1
  end
  fib
end

puts fib_last(15)
puts fib_last(100001)
puts fib_last(1_000_007)
puts fib_last(123456789)