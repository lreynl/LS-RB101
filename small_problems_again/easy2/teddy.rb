def teddy_age(name = 'Teddy', lower = 20, upper = 200)
  print 'What\'s your name? '
  input = gets.chomp
  input = name unless input.length > 0
  puts "#{input} is #{rand(lower..upper)} years old!"
end

teddy_age
