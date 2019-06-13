def fib(num)
  return num if num < 3
  num1 = 0
  num2 = 1
  counter = 1
  until counter == num
    temp = num1
    num1 = num2
    num2 += temp
    counter += 1
  end
  num2
end

puts fib(50)
puts fib(100000)