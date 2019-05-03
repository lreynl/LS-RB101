# loan payment calculator
def monthly_payment(years, principal, rate)
  rate /= 100 # convert to percentage
  rate /= 12  # to get monthly rate
  months = years * 12
  return principal / months if rate.zero?
  principal * (rate / (1 - (1 + rate)**(-1 * months)))
end

def prompt(msg)
  print "> #{msg}"
end

def valid_num?(num)
  /^\d*.?\d+$/.match(num) ? true : false
end

def integer?(num)
  num.to_f == num.to_f.round
end

def valid_principal?(num)
  valid_num?(num) && num.to_f > 0
end

def valid_duration?(num)
  valid_num?(num) && num.to_f > 0 && integer?(num)
end

def valid_apr?(num)
  valid_num?(num) && num.to_f >= 0
end

def validate(num, type)
  case type
  when 'amount'
    valid_principal?(num)
  when 'duration'
    valid_duration?(num)
  else
    valid_apr?(num)
  end
end

def input_number(msg, type)
  num = ''
  loop do
    prompt(msg)
    num = gets.chomp
    break if validate(num, type)
  end
  num.to_f
end

loop do
  system 'clear'

  prompt("~~~ Loan payment calculator ~~~\n")
  amount = input_number('How much is the loan amount? ', 'amount')
  duration = input_number('What\'s the duration in years? ', 'duration')
  interest = input_number('What\'s the annual percentage ' \
                          'interest rate (example 5 = 5%)? ', 'interest')

  result = monthly_payment(duration, amount, interest)

  prompt("~~~ Results ~~~\n")
  prompt("For your loan of $#{amount}:\n")
  prompt("At #{interest}% annual interest, \n")
  prompt("you\'ll make #{12 * duration.round} payments\n")
  prompt("of $#{format('%.2f', result.round(2))} per month.\n")
  prompt("Calculate another? (y/n) ")
  another = gets.chomp
  break unless another.downcase == 'y'
end
