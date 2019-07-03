TEST_PAIRS = { '(' => ')', '[' => ']', '{' => '}', "\"" => "\"", "'" => "'"}.freeze
QUOTES = %w(' ").freeze

def quote_test(str, char)
  str.count(char).even?
end

def balanced?(str, pairs = TEST_PAIRS, quotes = QUOTES)


#redo me
  stack = []
  str.chars.each do |char|
    if char == '('
      stack.push(char)
    elsif char == ')'
      test = stack.pop
      if test.nil?
        return false
      end
    end
  end
  stack.empty?
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false