name = 'Bob'
save_name = name
name.upcase!
puts name, save_name # prints BOB BOB since upcase! is mutating; they both still point to the same object



array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2 # some names are upcased since this is an array of references
