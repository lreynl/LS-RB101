def fib(nth)
  return nth if nth < 2
  fib(nth - 1) + fib(nth - 2)
end

20.times {|n|puts fib(n+1)}