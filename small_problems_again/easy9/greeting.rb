def greetings(arr, hash)
  str = "Hi, "
  str += arr.join(' ')
  str += ". Looks like you're a #{hash[:title]} #{hash[:occupation]}."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
