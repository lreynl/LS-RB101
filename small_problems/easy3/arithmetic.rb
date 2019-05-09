def numbers(num1, num2)
  puts "#{num1} + #{num2} = #{num1 + num2}"
  puts "#{num1} - #{num2} = #{num1 - num2}"
  puts "#{num1} * #{num2} = #{num1 * num2}"
  print "#{num1} / #{num2}"
  puts " = #{num1 / num2}" unless num2.zero?
  puts ' is undefined' if num2.zero?
  puts "#{num1} ^ #{num2} = #{num1**num2}"
end

print 'Enter first number: '
first = gets.chomp.to_f
print 'Enter second number: '
second = gets.chomp.to_f

numbers(first, second)
