def sum_square_difference(num)
  squared_sum = (1..num).reduce(:+)**2
  sum_of_squares = (1..num).map { |num| num**2 }.reduce(:+)
  squared_sum - sum_of_squares
end

p sum_square_difference(3)
p sum_square_difference(10)
p sum_square_difference(100)
