if false
  # variables in if blocks get initialized
  # to nil even if they're never used
  greeting = “hello world”
end

greeting

###

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => { a: "hi there" } (<< mutates original)

=begin
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
  # original variables unchanged;
  # = is non-mutating
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"    # => "one is: one"
puts "two is: #{two}"    # => "two is: two"
puts "three is: #{three}"# => "three is: three"

###

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
  # original variables unchanged;
  # = is non-mutating (same as before)
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"    # => "one is: one"
puts "two is: #{two}"    # => "two is: two"
puts "three is: #{three}"# => "three is: three"

###

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
  # strings are mutated with the .gsub! method
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"    # => "one is: two"
puts "two is: #{two}"    # => "two is: three"
puts "three is: #{three}"# => "three is: one"

=end

=begin
#def dot_separated_ip_address?(input_string)
#  dot_separated_words = input_string.split(".")
#  while dot_separated_words.size > 0 do
#    word = dot_separated_words.pop
#    break unless is_an_ip_number?(word)
#  end
#  return true
#end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

=end