#Repeat Yourself
def repeat(str, num=1)
  return puts "Number can't ne negative!" if num < 0
  num.times { puts str }
end

print "Type anything here: "
input = gets.chomp
print "How many times to repeat it? "
times = gets.chomp.to_i

repeat(input, times)
