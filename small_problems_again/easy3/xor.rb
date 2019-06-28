def xor?(a, b)
  !a && b || !b && a
end

puts xor?(true, true)
puts xor?(true, false)
puts xor?(false, true)
puts xor?(false, false)
