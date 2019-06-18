require 'io/console'

def sentence(text)
  punctuation = /[.!?]/
  text = text.split(punctuation)
  text.map! { |sentence| sentence.split(' ') }
  text.sort! { |a, b| b.length <=> a.length }
  text[0].length
end

def load_text(txt)
  text = ''
  File.open(txt).each { |line| text += (line.chomp + ' ') }
  sentence(text)
end

puts load_text('text1.txt')
puts load_text('f.txt')
