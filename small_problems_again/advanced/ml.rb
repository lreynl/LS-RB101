def load_text(file_name)
  text = ''
  File.open(file_name).each { |line| text += line.chomp }
  text
end

def madlib(text, word_list)

end

word_list = load_text('mlwords.txt')
text = load_text('mltext.txt')
puts madlib(text, word_list)