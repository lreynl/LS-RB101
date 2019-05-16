def fb(max)
  for num in (1..max) do
    print num unless (num % 3).zero? || (num % 5).zero?
    print 'Fizz' if (num % 3).zero?
    print 'Buzz' if (num % 5).zero?
    puts ''
  end
end

fb(30)