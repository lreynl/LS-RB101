def fib?(num)
  a = 0
  b = 1
  fib = 1
  until fib > num
    return true if fib == num
    a = b
    b = fib
    fib = a + b
  end
  false
end

def fib_index(arr)
  result = []
  arr.each_with_index { |elem, index| result.push(elem) if fib?(index) }
  result
end

p fib_index(['a','b','c','d','e','f','g','h','i','j'])