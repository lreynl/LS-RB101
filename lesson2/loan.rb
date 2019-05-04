# loan payment calculator
require 'yaml'
MESSAGES = YAML.load_file('loan_calc_messages.yaml')

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
  /^\d*.?\d+$/.match(num)
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

def error_message(type)
  puts MESSAGES['amount_error'] if type == 'amount'
  puts MESSAGES['duration_error'] if type == 'duration'
  puts MESSAGES['interest_error'] if type == 'interest'
end

def input_number(msg, type)
  num = ''
  loop do
    prompt(msg)
    num = gets.chomp
    break if validate(num, type)
    error_message(type)
  end
  num.to_f
end

def do_another
  prompt(MESSAGES['do_another'])
  loop do
    case gets.chomp.downcase
    when 'y'
      break true
    when 'n'
      break false
    else
      prompt(MESSAGES['another_error'])
    end
  end
end

def show_results(amount, duration, interest, result)
  prompt(MESSAGES['result_header'])
  prompt(format(MESSAGES['result_line1'], amount: format('%.2f', amount)))
  prompt(format(MESSAGES['result_line2'], interest: interest))
  prompt(format(MESSAGES['result_line3'], duration: 12 * duration.round))
  prompt(format(MESSAGES['result_line4'],
                result: format('%.2f', result)))
end

loop do
  system('clear') || system('cls')

  prompt(MESSAGES['app_header'])
  amount = input_number(MESSAGES['amount'], 'amount')
  duration = input_number(MESSAGES['duration'], 'duration')
  interest = input_number(MESSAGES['apr'], 'interest')

  result = monthly_payment(duration, amount, interest)
  show_results(amount, duration, interest, result.round(2))

  break unless do_another
end
