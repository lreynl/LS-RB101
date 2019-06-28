def multiply(a, b)
  a * b
end

def power(num, pow)
  result = 1
  pow.times { result = multiply(num, result) }
  result
end

puts power(5, 3)
puts power(2, 8)