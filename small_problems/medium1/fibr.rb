def fib_rec(num)
  if num < 2
    num
  else
    fib_rec(num - 1) + fib_rec(num - 2)
  end
end

puts fib_rec(30)