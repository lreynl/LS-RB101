[1, 2, 3].select do |num|
  num > 5
  'hi'
end # => [1, 2, 3] since 'hi' is truthy


['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end # => 2


[1, 2, 3].reject do |num|
  puts num
end # => [1,2 ,3] (always returns nil)


['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end # => { "a" => "ant", "b" => "bear", "c" => "cat" }


hash = { a: 'ant', b: 'bear' }
hash.shift # => ['a', 'ant']


['ant', 'bear', 'caterpillar'].pop.size # => 11


[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# 1
# => true (breaks as soon as true is returned)


arr = [1, 2, 3, 4, 5]
arr.take(2) # => [1, 2] (new array; non-destructive)


{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end # => [nil, "bear"]


[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end # => [1, mil, nil]
