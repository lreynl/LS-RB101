def odd_elements(arr)
  result = []
  arr.each_with_index do |elem, index|
    result << elem if (index + 1).odd?
  end
  result
end

p odd_elements([1,2,3,4,5,6,7,8,9])
p odd_elements([])