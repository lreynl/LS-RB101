def stringy(num)
  return if num < 1
  return '1' if num == 1
  result = ''
  (num / 2).times { result << '10' } # works when num is odd because it rounds down
  result << '1' if num.odd?
  result
end

puts stringy(0) == nil
puts stringy(1) == '1'
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'