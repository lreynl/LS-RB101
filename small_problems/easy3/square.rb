def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power(num, pow)
  x = 1
  pow.times { x = multiply(x, num) }
  x
end

print 'Enter a number: '
num = gets.chomp.to_f
print 'Raise to what power? '
pow = gets.chomp.to_i

puts square(num)
puts power(num, pow)