def char_count(phrase)
  phrase.delete(' ').length
end

print 'Enter a word or phrase: '
phrase = gets.chomp

puts "\'#{phrase}\' has #{char_count(phrase)} characters."
