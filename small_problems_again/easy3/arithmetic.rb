def numbers
  print 'Enter first number: '
  first = gets.chomp.to_f
  print 'Enter second number: '
  second = gets.chomp.to_f
  [first, second]
end

def operations(num)
  puts "#{num[0]} + #{num[1]} = #{num[0] + num[1]}"
  puts "#{num[0]} - #{num[1]} = #{num[0] - num[1]}"
  puts "#{num[0]} * #{num[1]} = #{num[0] * num[1]}"
  if num[1].zero?
    puts "#{num[0]} / #{num[1]} = undefined"
    puts "#{num[0]} % #{num[1]} = undefined"
  else
    puts "#{num[0]} / #{num[1]} = #{num[0] / num[1]}"
    puts "#{num[0]} % #{num[1]} = #{num[0] % num[1]}"
  end  
  puts "#{num[0]} ^ #{num[1]} = #{num[0] ** num[1]}"
end

operations(numbers)
 