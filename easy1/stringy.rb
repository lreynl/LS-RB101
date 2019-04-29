def stringy(length)
  str = ''
  length.times do |index|
    str += '1' if index.even?
    str += '0' if index.odd?
  end
  str
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
    
