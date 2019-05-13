list = { 'a noun' => '',
         'a verb' => '',
         'an adjective' => '',
         'an adverb' => '' }

def madlib(list)
  list.each do |key, _|
    print "Enter #{key}: "
    list[key] = gets.chomp
  end
end

def result(list)
  puts "Do you #{list['a verb']} your #{list['an adjective']} " \
       "#{list['a noun']} #{list['an adverb']}? That's hilarious!"
end

madlib(list)
result(list)