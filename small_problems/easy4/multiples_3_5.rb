#def multiples(input)
#  sum = 0
#  input.times do |num|
#    sum += num + 1 if ((num + 1) % 3).zero? || ((num + 1) % 5).zero?
#  end
#  sum
#end

def multiples(input)
  (1..input).select { |num| (num % 3).zero? || (num % 5).zero? }.reduce(:+)
end

p multiples(3)
p multiples(5)
p multiples(10)
p multiples(1000)
