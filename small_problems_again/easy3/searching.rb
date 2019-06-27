SUFFIXES = %w(st nd rd th th)

def five_numbers
  list = []
  SUFFIXES.each_with_index do |suffix, index|
    print "Enter the #{index + 1}#{suffix} number: "
    list << gets.chomp.to_i
  end
  list
end

def number
  print "Enter the last number: "
  gets.chomp.to_i
end

def list_includes(list, num)
  list.include?(num) ? "includes" : "does not include"
end

list = five_numbers
last_number = number
puts "The list #{list} #{list_includes(list, last_number)} the number #{last_number}"