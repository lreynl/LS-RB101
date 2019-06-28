def string_to_signed_integer(str)
  vals = { '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
           '7' => 7, '8' => 8, '9' => 9, '0' => 0 }
  int = 0
  neg = false
  str = str.reverse
  if str[-1] == '-'
    str.chop!
    neg = true
  elsif str[-1] == '+'
    str.chop!
  end
  str.split('').each_with_index do |digit, index|
    int += vals[digit] * 10**index
  end
  int *= -1 if neg
  int
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100