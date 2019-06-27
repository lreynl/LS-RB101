def age_year
  print "How old are you? "
  age = gets.chomp.to_i
  print "When do you want to retire? "
  retire = gets.chomp.to_i
  { age: age, retire: retire }
end

def retire(age_data)
  present = Time.now.year
  puts "It's #{present} now. You'll retire in #{(age_data[:retire] - age_data[:age]) + present}."
  puts "That's #{age_data[:retire] - age_data[:age]} years to go!"
end

retire(age_year)