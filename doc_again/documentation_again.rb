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

my_method(4, 5, 6)
