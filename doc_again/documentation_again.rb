#File::path is a class method and can only be called on the File class: File.path('/some/path')
#
#File#path is an instance method and can only be called on an instance of the File class: File.new('/some/path').path


require 'date'

puts Date.new  #The default is the beginning of the Julian period
puts Date.new(2016)  #The first three arguments are Year, Month, Day. 
puts Date.new(2016, 5)  #The default Day and
puts Date.new(2016, 5, 13)  #Month are both 1



def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6) #prints [4, 5, 3, 6]



a = [1, 4, 8, 11, 15, 19]
puts a.bsearch { |num| num > 8 } #prints 11



a = %w(a b c d e)
#puts a.fetch(7) #error
puts a.fetch(7, 'beats me') #prints 'beats me'
puts a.fetch(7) { |index| index**2 } # prints 49



5.step(to: 10, by: 3) { |value| puts value } #prints 5 8



s = 'abc'
puts s.public_methods.inspect #prints all available methods
puts s.public_methods(all=false).inspect #prints methods unique to string class



a = [5, 9, 3, 11]
puts a.min(2) # { |x, y| x <=> y }
