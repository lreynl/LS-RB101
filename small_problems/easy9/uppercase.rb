def uppercase?(str)
  return false if str.empty?
  str.chars.select { |char| /[a-z]/i =~ char }.all? do |char|
    char.ord >= 65 && char.ord <= 90
  end
  #or str == str.upcase
end

p uppercase?('aaaaa')
p uppercase?('ABCD')
p uppercase?('123abC')
p uppercase?('123ABC')
p uppercase?('')
