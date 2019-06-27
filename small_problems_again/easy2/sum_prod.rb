def number
  print "Enter a number: "
  gets.chomp.to_i
end

def sum_prod
  operator = ''
  while operator != 's' && operator != 'p'
    print "Do you want the sum or product (s/p)? "
    operator = gets.chomp.downcase
  end
  operator
end

def do_op(num, op)
  if op == 's'
    (1..num).reduce(:+)
  else
    (1..num).reduce(:*)
  end
end

p do_op(number, sum_prod)