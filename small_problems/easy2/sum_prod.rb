def get_result(num, s_or_p)
  return (1..num).reduce(&:+) if s_or_p == 's'
  return (1..num).reduce(&:*) if s_or_p == 'p'
end 

def get_num
  num = 0
  while num <= 0
    print "Enter a positive integer: "
    num = gets.chomp.to_i
  end
  num
end

def get_choice
  choice = ''
  while choice != 's' && choice != 'p'
    print "Do you want the sum or product of the numbers from 1 up to your number? (s or p) "
    choice = gets.chomp
  end
  choice
end

num = get_num
(operation = get_choice) == 's' ? choice = "sum" : choice = "product"
puts "The #{choice} of the numbers from 1 to #{num} is #{get_result(num, operation)}."
  
