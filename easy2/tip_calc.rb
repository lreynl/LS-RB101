def calc_tip(bill, tip)
  tip = bill * tip / 100
  puts "The tip is $#{"%.2f" % tip.round(2)}"
  puts "The total bill is $#{"%.2f" % (bill + tip).round(2)}"
end

print "What's the bill? "
bill = gets.chomp.to_f
print "What's the tip percentage? "
tip = gets.chomp.to_f

calc_tip(bill, tip)
