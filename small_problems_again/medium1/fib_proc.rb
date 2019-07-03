def fib(nth)
  a = 0
  b = 1
  fib = 1
  counter = 1
  until counter == nth
    fib = a + b
    a = b
    b = fib
    counter += 1
  end
  fib
end

#20.times {|n|puts fib(n+1)}
puts fib(100_000)