def crunch(phrase)
  words = phrase.split
  words.map { |word| de_dup(word) }.join(' ')
end

def de_dup(word)
  word = word.chars
  i = 0
  while i < word.length - 1 do
    if word[i] == word[i + 1]
      word.delete_at(i + 1)
    else
      i += 1
    end
  end
  word.join
end

p crunch('4444abcabccba')
p crunch('ddaaiillyy ddoouubbllee')
p crunch('ggggggggggggggg')
p crunch('a')
p crunch('')