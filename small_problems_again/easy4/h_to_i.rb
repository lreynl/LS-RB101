def hexadecimal_to_integer(str)
  vals = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
           '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'a' => 10, 'b' => 11,
           'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15 }
  int = 0
  str.split('').reverse.each_with_index do |digit, index|
    int += vals[digit.downcase] * 16**index
  end
  int
end

p hexadecimal_to_integer('4D9f') == 19871
