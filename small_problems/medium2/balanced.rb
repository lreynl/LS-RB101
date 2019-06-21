PUSH = [['(', ')'], ['[', ']'], ["\""], ['\'']]

def quote(str, char)
  if char == '\'' && str.count('\'').odd?
    return false
  elsif char == "\"" && str.count("\"").odd?
    return false
  end
  true
end

def balanced?(str)
  stack = []
  PUSH.each do |pair|
    return false unless quote(str, pair[0])
    str.each_char do |char|
      if pair[0] == char
        stack.push(char)
      elsif pair[1] == char
        popped = stack.pop
        return false unless popped
      end
    end
  end
  true
end

p balanced?('What (is) this?')
p balanced?('((What)) (is this))?')
p balanced?('What ((is))) up(')
p balanced?('((What) (is this))?')
p balanced?('Hey!')
p balanced?('')
p balanced?('\'')
p balanced?('\'\'')
p balanced?("\"")
p balanced?("\"\"")
p balanced?("\"[\"]")
p balanced?('[(])')