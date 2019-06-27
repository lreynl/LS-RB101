def count_occurrences(arr)
  result = {}
  arr.each do |elem|
    result[elem] ||= 0
    result[elem] += 1
  end
  result.each do |key, val|
    puts key + " => " + val.to_s
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)