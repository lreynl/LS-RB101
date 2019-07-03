def load_text(file_name)
  text = ''
  File.open(file_name).each { |line| text << line.chomp + ' ' }
  text
end

def longest_sentence(file_name)
  txt = load_text(file_name)
  split_on = /[.?!]/
  txt = txt.split(split_on).sort { |a, b| b.split(' ').length <=> a.split(' ').length }
  #txt[0].split(' ').length
  txt[0]
end

test = longest_sentence('kjv.txt')
puts test
puts test.split(' ').length