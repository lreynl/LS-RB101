def fix(val)
  val << 'xyz'
  val = val.upcase
  val.concat('!')
end

string = 'hello'
string2 = fix(string)
p string
p string2
