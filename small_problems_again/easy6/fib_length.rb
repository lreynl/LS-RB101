def find_fibonacci_index_by_length(digits)
  a = 0
  b = 1
  index = 1
  fib = 0
  loop do
    return index if Math.log(fib, 10) >= digits - 1
    fib = a + b
    a = b
    b = fib
    index += 1
  end
end



p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847