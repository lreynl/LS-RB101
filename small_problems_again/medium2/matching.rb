TEST_PAIRS = { '(' => ')', '[' => ']', '{' => '}' }.freeze
QUOTES = %w(' ").freeze

def quote_test(str, char)
  str.count(char).even?
end

def balanced?(str, pairs = TEST_PAIRS, quotes = QUOTES)
  stack = nil
  pairs.each_pair do |left, right|
  stack = []
    str.chars.each do |char|
      if char == left
        stack.push(char)
      elsif char == right
        test = stack.pop
        if test.nil?
          return false
        end
      end
    end
    return false if !stack.empty?
  end
  quotes.each do |quote|
    return false unless str.count(quote).even?
  end
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('square[] bra[[[]]]ckets') == true
p balanced?('square[] bra[[[]]ckets') == false
p balanced?('}}}Im a butterfly!{{{') == false
p balanced?('{{{Im a rock!}}}') == true
p balanced?("}}}I'm a butterfly!{{{") == false
p balanced?("{{{I'm a butterfly!}}}") == false
p balanced?("I have \"mismatched' quotes!") == false