DIGITS = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
           'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
           'eight' => '8', 'nine' => '9' }.freeze
           
def build_word_regex(list)
  reg = ''
  list.each do |elem|
    reg += '\b'
    reg += elem.to_s
    reg += '\b'
    reg += '|'
  end
  reg.chop
end

def build_string_regex(list)
  reg = ''
  list.each do |elem|
    reg += elem
    reg += '|'
  end
  reg.chop
end

def word_to_digit(str, digits = DIGITS)
  digit_words = digits.keys
  reg = build_word_regex(digit_words) #'\bone\b|\btwo\b|\bthree\b|\bfour\b|\bfive\b|\bsix\b|\bseven\b|\beight\b|\bnine\b|\bzero\b'
  
  reg2 = build_string_regex(digit_words) #'one|two|three|four|five|six|seven|eight|nine|zero'
  space_regex = /(?<=#{reg})\s(?=#{reg})/
  str.gsub!(space_regex, '')
  digit_string = str[/(#{reg2})+/]
  replacement = digit_string.dup
  digits.keys.each { |digit| replacement.gsub!(digit, digits[digit]) }
  str.gsub!(digit_string, replacement)
  str
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
