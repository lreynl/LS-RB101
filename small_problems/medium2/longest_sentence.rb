def sentence(text)
  punctuation = /[.!?]/
  text = text.split(punctuation)
  text.sort { |a, b| b.length <=> a.length }
  text[0].length
end

def load_text
  File.open('text1.txt', 'r').to_s
end

puts sentence(load_text)