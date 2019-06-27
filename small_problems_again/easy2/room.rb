SQ_IN = 144
SQ_CM = 929.0304

def area(width, length)
  puts "The area is #{(width * length).round(2)} square feet " \
       "or #{(width * length * SQ_IN).round(1)} square inches " \
       "or #{(width * length * SQ_CM).round} square centimeters."
end  

def room_size
  print 'How long is the room in feet? '
  length = gets.chomp.to_f
  print 'How wide is the room in feet? '
  width = gets.chomp.to_f
  [width, length]
end

dimensions = room_size
area(dimensions[0], dimensions[1])
