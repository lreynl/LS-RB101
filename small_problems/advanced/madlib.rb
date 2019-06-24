LIST = { noun: %w(cat dog person house car bird critter tree spider caterpillar snake grass tomato),
         adjective: %w(red orange yellow green blue purple quick slow silly weird normal suspicious ordinary),
         adverb: %w(slowly angrily quickly stupidly absentmindedly happily calmly agitatedly clearly),
         verb: %w(made walked ran flew worked climbed sat ate gobbled drank twisted hit cleaned touched) }.freeze

def words(type, list)
  word = list[type].sample
  list[type].delete(word)
  word
end

def load_text(file_name)
  text = ""
  File.open(file_name).each { |line| text += (line) }
  text
end

def madlib(txt)
  list = LIST.dup
  eval txt
end

text = load_text("mltext.txt")
puts madlib(text)
