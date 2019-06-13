=begin
def fib_last_digit(num)
  return num if num <= 5
  num1 = 0
  num2 = 1
  counter = 1
  until counter == num
    temp = num1
    num1 = num2
    num2 += temp
    counter += 1
  end
  num2 % 10
end
=end

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end
  last_2.last
end

def build_last_digit_list
  (0..59).each_with_object([]) { |fib, list| list << fibonacci_last(fib) }
end

def fib_last(nth)
  last_digit_list = build_last_digit_list
  puts last_digit_list[nth % 60]
end

fib_last(7)
fib_last(100)
fib_last(123_456_789_987_745)