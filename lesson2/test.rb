def fix(val)
  val << 'xyz'
  val = val.upcase
  val.concat('!')
end

string = 'hello'
string2 = fix(string)
p string
p string2


def test_method
  prompt('test message')
end

test_method           # second, try invoking "test_method" here

def prompt(message)
  Kernel.puts("=> #{message}")
end

test_method           # first, try invoking "test_method" here