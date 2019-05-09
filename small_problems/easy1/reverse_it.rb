def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('Is it weird how saying sentences backwards creates backwards sentences saying how weird it is') == 'is it weird how saying sentences backwards creates backwards sentences saying how weird it Is'


def reverse_words(sentence)
  sentence = sentence.split.each { |word| word.reverse! if word.length >= 5 }
  sentence.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
