def too_big?(num)
  num >= 9876543210
end

def valid?(num)
  num.odd? && (num % 7 == 0) && (num.digits == num.digits.uniq)
end

def featured(num)
  num += 1 if valid?(num)
  until num % 7 == 0
    num += 1
  end
  num += 7 if num.even?
  return 'none exist' if too_big?(num)
  loop do
    return num if valid?(num)
    num += 14
  end
end


p featured(12)== 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) == 'none exist'