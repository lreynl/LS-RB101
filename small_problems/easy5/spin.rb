def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world")
# Since .split creates a new object, the
# method doesn' return the same object it
# was passed.