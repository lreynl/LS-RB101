def word_sizes(phrase)
  words = phrase.split
  lengths = Hash.new(0)
  words.each do |word|
    word.gsub!(/[^a-zA-Z]/, '')
    lengths[word.length] += 1
  end
  lengths
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes('')
p word_sizes("What's up doc?")