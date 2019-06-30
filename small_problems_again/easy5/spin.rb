def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
# returns new object since .join doesn't mutate the array
end

spin_me("hello world") # "olleh dlrow"
