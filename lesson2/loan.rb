# loan payment calculator
def payment(years, principal, rate)
  rate /= 100 # convert to percentage
  rate /= 12  # to get monthly rate
  months = years * 12
  principal * (rate / (1 - (1 + rate)**(-1 * months)))
end

def num(msg)
  num = 'a'
  while !/^[-+]?\d*.?\d+$/.match(num)
    print msg
    num = gets.chomp
  end
  num.to_f
end

puts '~~~ Loan payment calculator ~~~'
amount = num('How much is the loan amount? ')
duration = num('What\'s the duration in years? ')
interest = num('What\'s the annual percentage interest rate (example 5 = 5%)? ')
result = payment(duration, amount, interest)

puts '~~~ Results ~~~'
print "At #{interest}% annual interest, \n"
print "you\'ll make #{12 * duration.round} payments\n"
print "of $#{format('%.2f', result.round(2))} per month.\n"
