def palindrome?(str)
  str == str.reverse
end

def check(str)
  str = str.to_s
  palindrome?(str.split('').select { |char| /[a-zA-Z0-9]/.match(char) }
                           .join('').downcase)
end

p palindrome?('satanoscillatemymetallicsonatas')
p palindrome?('satan oscillate my metallic sonatas')
p check('123454321')
p check('A man, a plan, a canal, Panama')
p check('123ab321')
p check('123aba321')
p check(1234567890987654321)
p check(000123321000)