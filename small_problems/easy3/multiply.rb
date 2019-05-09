def multiply(num1, num2)
  num1 * num2
end

print 'Enter first number: '
first = gets.chomp.to_f
print 'Enter second number: '
second = gets.chomp.to_f

puts multiply(first, second)
