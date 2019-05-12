def title_case(str)
  str.split
     .map { |word| word.capitalize }
     .join(' ')
end

puts title_case('four score and seven') 
puts title_case('the javaScript language')
puts title_case('this is a "quoted" word')