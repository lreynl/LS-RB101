def greet(name)
  last_char = name[-1]
  case last_char
  when '!'
    puts "HI #{name.slice(0, name.length - 1).upcase}, WHY ARE WE SCREAMING??"
  else
    puts "Hi, #{name}."
  end
end

print "What's your name? "
name = gets.chomp

greet(name)
