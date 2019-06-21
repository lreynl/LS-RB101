def words(type, list = LIST)
  list[type].sample
end

LIST = { noun: %w(cat dog person house car bird critter tree spider caterpillar),
         adjective: %w(red orange yellow green blue purple quick slow silly weird normal suspicious ordinary),
         adverb: %w(slowly angrily quickly stupidly absentmindedly happily calmly agitatedly clearly),
         verb: %w(went walked ran said spoke climbed sat ate gobbled drank twisted hit cleaned touched) }

TEXT = "The #{words(:adjective)} #{words(:adjective)} #{words(:noun)} #{words(:adverb)}\n" \
       "#{words(:verb)} the #{words(:adjective)} #{words(:adjective)}\n" \
       "#{words(:noun)}, who #{words(:adverb)} #{words(:verb)} its\n" \
       "#{words(:noun)} and #{words(:verb)} #{words(:adverb)}."

def madlib(text = TEXT)
  text
end

puts madlib