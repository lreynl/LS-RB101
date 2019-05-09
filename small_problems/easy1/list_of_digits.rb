#list of digits
def digit_list(num)
  arr = num.to_s.split('').map { |c| c.to_i }
end

p digit_list(76543)
