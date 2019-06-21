def too_big?(num)
  num > 9876543210
end

def featured?(num)
  num.odd? &&
  num % 7 == 0 &&
  num.digits.uniq == num.digits &&
  !too_big?(num)
end

def next_featured(num)
  num += 14 if featured?(num) # if you pass it a featured number, go to next possible
  until num % 7 == 0 # gets it to the next multiple of 7
    num += 1
  end
  num += 7 if num.even? # goes to next multiple of 7 if that one's even
  loop do 
    break if featured?(num)
    return 'Not possible!' if too_big?(num)
    num += 14
  end
  num
end

p next_featured(12)
p next_featured(20)
p next_featured(21)
p next_featured(997)
p next_featured(1029)
p next_featured(999999)
p next_featured(999999987)
p next_featured(9_999_999_999)
p next_featured(9876543211)
