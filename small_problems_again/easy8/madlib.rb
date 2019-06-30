def prompt(text)
  print text
end

def word_input(list)
  list.each_key do |type|
    prompt("Enter #{type}: ")
    list[type] = gets.chomp
  end
end

def madlib(text, list)
  list.values.each do |word|
    text = text.sub('?word', word)
  end
  text
end

text = "Do you ?word your ?word ?word ?word? That's hilarious!"

list = { 'a verb' => '',
         'an adjective' => '',
         'a noun' => '',
         'an adverb' => '' }
         
word_list = word_input(list)
puts madlib(text, word_list)
