def rotate(obj=nil)
  if obj.class == Array
    return [] if obj.empty?
    copy = obj.clone
    rotate_me(copy)
  elsif obj.class == String
    copy = obj.split('')
    rotate_me(copy).join
  elsif obj.class == Integer
    copy = obj.to_s.split('')
    rotate_me(copy).join.to_i
  else
    'error'
  end
end

def rotate_me(arr)
  arr.push(arr.shift)
end

p rotate([1, 2, 3, 4, 5])
p rotate("TESTING")
p rotate(12345)
p rotate([])
p rotate('')
p rotate(0)
p rotate(123.45)
p rotate()