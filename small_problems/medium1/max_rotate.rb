def max_rotate(num)
  split = num.to_s.split('')
  len = split.length
  (1..len).to_a.reverse.each { |digit| split = rotate(split, digit) }
  split.join
end

def rotate(copy, digits)
  first = copy[0..(-digits - 1)]
  second = rotate_me(copy[-digits..-1])
  first + second
end

def rotate_me(arr)
  arr.push(arr.shift)
end

p max_rotate(105)
p max_rotate(5)
p max_rotate(735291)
p max_rotate(8_703_529_146)