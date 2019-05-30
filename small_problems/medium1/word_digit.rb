def word_to_digit(str)
  digits = { zero: '0', one: '1', two: '2', three: '3',
             four: '4', five: '5', six: '6', seven: '7',
             eight: '8', nine: '9' }
  digits.each do |key, val|
    str.gsub!(/\b#{key}\b/, val)
  end
  space_regex = /(?<=\d)\s+(?=\d)/
  phone_regex = /(\d{3})(\d{3})(\d{4})/
  phone_format = '(\1) \2-\3'
  str.gsub!(space_regex, '')
  str.gsub(phone_regex, phone_format)#gsub! returns nil if no subs
end

p word_to_digit('Phone artwork threefold fourier fives sixsided seventeen counterweight quinine subzero')
p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit('My phone number is eight zero eight nine nine nine one two three four.')
p word_to_digit('a1b2c3d4')