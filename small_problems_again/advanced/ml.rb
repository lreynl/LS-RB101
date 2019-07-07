WORD_LIST = { noun: %w(cat dog person kid caterpiller tomato cucumber),
              verb: %w(ate walked threw visualized trampled),
              adverb: %w(slowly quickly questioningly dismissively abruptly),
              adjective: %w(red blue yellow tall short skinny perplexed loved) }

def word(word_list, type)
  word = word_list[type].sample
  word_list[type].delete(word)
  word
end

def load_text(file_name)
  text = ''
  File.open(file_name).each { |line| text += line }
  text
end

def madlib(text, word_list)
  list = word_list.dup
  eval text
end

#word_list = load_text('mlwords.txt')
text = load_text('mltext.txt')
puts madlib(text, WORD_LIST)