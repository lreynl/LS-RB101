def retire_year(age, target)
  puts "If you're #{age} now, and you want to retire at #{target},"
  puts "then you have #{target - age} years to go until you retire"
  puts "in #{Time.now.year + (target - age)}!"
end

print "How old are you? "
age = gets.chomp.to_i
print "At what age do you think you want to retire? "
target = gets.chomp.to_i

retire_year(age, target)
