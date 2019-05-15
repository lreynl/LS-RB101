def greetings(name, info)
  puts "Hello, #{name.join(' ')}! Nice to have a " \
       "#{info[:title]} #{info[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
