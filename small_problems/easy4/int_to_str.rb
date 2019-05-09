STR_INT = { 1 => '1',
            2 => '2',
            3 => '3',
            4 => '4',
            5 => '5',
            6 => '6',
            7 => '7',
            8 => '8',
            9 => '9',
            0 => '0' }

# signed int to string
def int_to_str(int)
  return STR_INT[int] if int.zero?
  if int < 0
    int *= -1
    neg = true
  end
  str = ''
  loop do
    str.prepend(STR_INT[int % 10])
    int /= 10
    break if int.zero?
  end
  neg ? str.prepend('-') : str.prepend('+')
end

p int_to_str(12345)
p int_to_str(0)
p int_to_str(999)
p int_to_str(-555)