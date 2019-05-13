def sums(arr)
  sum = 0
  until arr.empty?
    arr.each { |num| sum += num }
    arr.pop
  end
  sum
end

p sums([1, 5, 7, 3])
p sums([3,5,2])
p sums([4])
p sums([1,2,3,4,5])
p sums([])