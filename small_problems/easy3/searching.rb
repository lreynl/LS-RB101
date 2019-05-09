# searching 101
numbers = { 1 => 'first', 2 => 'second', 3 => 'third',
            4 => 'fourth', 5 => 'fifth', 6 => 'last' }
input = []
numbers.length.times do |index|
  print "Enter #{numbers[index + 1]} number: "
  num = gets.chomp.to_i
  input << num unless index == numbers.length - 1
  if index == numbers.length - 1
    if input.include?(num)
      puts "The number #{num} is in #{input}"
    else
      puts "The number #{num} is not in #{input}"
    end
  end
end
