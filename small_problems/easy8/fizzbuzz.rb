def fb(start, stop)
  for num in (start..stop) do
    print num unless num % 3 == 0 || num % 5 == 0
    print 'Fizz' if num % 3 == 0
    print 'Buzz' if num % 5 == 0
    puts ''
  end
end

fb(1, 30)