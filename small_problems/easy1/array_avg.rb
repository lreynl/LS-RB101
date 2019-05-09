def average(arr)
  sum = 0.0
  arr.each { |num| sum += num }
  sum / arr.length
end

p average([1, 5, 87, 45, 8, 8])
puts average([1, 5, 87, 45, 8, 8]) == 25
p average([9, 47, 23, 95, 16, 52])
puts average([9, 47, 23, 95, 16, 52]) == 40
