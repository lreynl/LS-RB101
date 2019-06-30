def fizzbuzz(start, stop)
  (start..stop).each do |num|
    print 'Fizz' if num % 3 == 0
    print 'Buzz' if num % 5 == 0
    print num unless num % 3 == 0 || num % 5 == 0
    puts ''
  end
end

fizzbuzz(1,25)
    