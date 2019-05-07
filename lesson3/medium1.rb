10.times { |i| puts ' ' * i + "The Flintstones Rock!" }


# puts "the value of 40 + 2 is " + (40 + 2)
puts "the value of 40 + 2 is " + (40 + 2).to_s
# or
val = 40 + 2
puts "the value of 40 + 2 is #{val}"


def factors(number)
  return [] if number.zero?
  if number < 0
    number *= -1
    neg = true
  end
  divisor = number
  factors = []
  #begin
    # only add number to factors if divisor divides number
    # with no remainder
  #  factors << number / divisor if number % divisor == 0
  #  divisor -= 1
  #end until divisor == 0
  # OR
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors.map { |factor| factor *= -1 } if neg
  # implicit return
  factors
end

p factors(50)
p factors(-50)
p factors(0)
p factors(100)


# mutates the original array
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# returns a copy - doesn't mutate original array
def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

=begin
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
# variable 'limit' isn't visible inside fib() method
# change method to def fib(first_num, second_num, limit)
# and call to fib(0, 1, limit)
=end


=begin
def tricky_method(a_string_param, an_array_param)
  #a_string_param += "rutabaga"
  #an_array_param << "rutabaga" change to:
  an_array_param << a_string_param + "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
=end

=begin
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# prints 34 since method made a copy
=end


munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
# The method mutates the original hash.
# The .values doesn't make a a new array but lets
# the .each operate on the original


=begin
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# prints "paper"
=end


=begin
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
# => "no"
=end

