SQF = 10.7639

def area(length, width)
  print "The area of your room is #{(length * width).round(2)} square meters " + \
        "(#{(length * width * SQF).round(1)} square feet)"
end

print "How long is the room in meters? "
length = gets.chomp.to_f
print "How wide is the room in meters? "
width = gets.chomp.to_f

puts area(length, width)
