def word_lengths(phrase)
  #words = []
  #phrase.split.each { |word| words << word.concat(' ' + word.length.to_s) }
  phrase.split.map do |word|
    word + ' ' + word.length.to_s
  end
end

p word_lengths("baseball hot dogs and apple pie")
p word_lengths("It ain't easy, is it?")
p word_lengths("")
