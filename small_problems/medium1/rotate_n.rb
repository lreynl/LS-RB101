def rotate(obj = nil, digits = 1)
  return 'error' if obj.class != Integer || digits < 1
  return obj if digits == 1
  copy = obj.to_s.split('')
  if copy.length <= digits
    rotate_me(copy).join.to_i
  else
    first = copy[0..(-digits - 1)]
    second = rotate_me(copy[-digits..-1])
    (first + second).join.to_i
  end
end

def rotate_me(arr)
  arr.push(arr.shift)
end

p rotate(12345, 1) #=> 12345
p rotate(12345, 2) #=> 12354
p rotate(12345, 3) #=> 12453
p rotate(12345, 4) #=> 13452
p rotate(12345, 5) #=> 23451
p rotate(12345, -1) #=> 'error'