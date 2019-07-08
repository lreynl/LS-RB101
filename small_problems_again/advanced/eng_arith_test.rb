NUMBERS = { 'zero' => '0',
            'one' => '1',
            'two' => '2',
            'three' => '3',
            'four' => '4',
            'five' => '5',
            'six' => '6',
            'seven' => '7',
            'eight' => '8',
            'nine' => '9' }

OPERATORS = { 'plus' => '+',
              'minus' => '-',
              'times' => '*',
              'divide' => '/' }

def eng_to_expression(str)
  str_copy = str.dup
  NUMBERS.keys.each do |num|
    str_copy.gsub!(num, NUMBERS[num])
  end
  OPERATORS.keys.each do |op|
    str_copy.gsub!(op, OPERATORS[op])
  end
  eval str_copy    
end

p eng_to_expression('4 plus 2 times 3')