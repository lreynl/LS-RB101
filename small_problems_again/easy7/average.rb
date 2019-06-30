def average(arr)
  (arr.reduce(:*) / arr.length.to_f).round(3)
end  

def show_multiplicative_average(arr)
  puts "The average is %.3f." % average(arr)
end

show_multiplicative_average([2, 5, 7, 11, 13, 17])
show_multiplicative_average([6])
