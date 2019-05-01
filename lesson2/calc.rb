require 'pry'

def get_result(num1, num2, op)
  case op
  when 'd'
    num2.zero? ? 'error :(' : num1 / num2
  when 'a'
    num1 + num2
  when 's'
    num1 - num2
  when 'm'
    num1 * num2
  else
    'you broke it.'
  end
#binding.pry
end

def num(str)
  num = 'a'
  while !/^[-+]?\d*.?\d+$/.match(num)
    print "Enter #{str} number: "
    num = gets.chomp
  end
  num.to_f
end

def operator
  choice = ''
  while choice != 'a' && choice != 's' && choice != 'm' && choice != 'd'
    print 'Do you want to add, subtract, multiply or divide? (a, s, m, or d) '
    choice = gets.chomp
  end
  choice
end

num1 = num('first')
num2 = num('second')
op = operator

print "The answer is #{get_result(num1, num2, op)}\n"
