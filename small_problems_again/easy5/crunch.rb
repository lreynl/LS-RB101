=begin
def crunch(str)
  result = ''
  str = str.split('')
  while !str.empty?
    if result.empty?
      result << str.shift
    elsif result[-1] == str[0]
      str.shift
    else
      result << str.shift
    end
  end
  result
end
=end

def crunch(str)
  repeated = /(.)(?=\1)/
  str = str.gsub(repeated, '') 
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''