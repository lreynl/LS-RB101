def prime?(num)
  (2..Math.sqrt(num)).each { |index| return false if num % index == 0 }
  true
end

def test_range(start, stop)
  results = []
  (start..stop).each { |num| results << num if prime?(num) }
  results
end

p test_range(10, 30)