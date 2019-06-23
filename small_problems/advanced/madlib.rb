LIST = { noun: %w(cat dog person house car bird critter tree spider caterpillar),
         adjective: %w(red orange yellow green blue purple quick slow silly weird normal suspicious ordinary),
         adverb: %w(slowly angrily quickly stupidly absentmindedly happily calmly agitatedly clearly),
         verb: %w(went walked ran said spoke climbed sat ate gobbled drank twisted hit cleaned touched) }

def words(type, list = LIST)
  list[type].sample
end

def load_text(file_name)
  text = ""
  File.open(file_name).each { |line| text += (line.chomp + ' ') }
  text
end

def madlib(txt)
  eval txt
end

text = load_text("mltext.txt")
puts text.class
puts madlib(text)
