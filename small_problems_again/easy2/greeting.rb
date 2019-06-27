def name
  print "What's your name? "
  gets.chomp
end

def greeting(name)
  if name[-1] == '!'
    puts "HI #{name.upcase} WHY ARE WE SCREAMING?"
  else
    puts "Hi, #{name}."
  end
end

greeting(name)