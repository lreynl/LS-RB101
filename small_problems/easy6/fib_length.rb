# iteration method
# O(n)
=begin
def find_fib(digits)
  a = 1
  b = 1
  fib = 2
  index = 2
  loop do
    fib = a + b
    index += 1
    break if Math.log10(fib) > digits - 1
    a = b
    b = fib
  end
  index
end
=end

# Finding the first fibonacci number with
# n digits is the same as finding the first 
# fibonacci number greater than or equal to
# 10^(n-1).
# This uses a method based on Binet's
# formula and using a derivation found here:
# https://www.quora.com/Given-a-number-N-how-do-I-efficiently-find-the-
# closest-Fibonacci-number-N
#
# I think it's O(log n)

require 'bigdecimal/math'
include BigMath
def find_fib(digits)
  alpha = (1 + BigMath.sqrt(BigDecimal(5), 10)) / BigDecimal(2)
  log_alpha = BigMath.log(alpha, 10)
  n = BigDecimal(10**(digits - 1))
  (BigMath.log(BigMath.sqrt(BigDecimal(5), 10) * n, 10) / log_alpha).ceil
end

puts find_fib(2)
puts find_fib(3)
puts find_fib(10)
puts find_fib(100)
puts find_fib(1000)
puts find_fib(10000)
puts find_fib(98765)
puts find_fib(987654)
