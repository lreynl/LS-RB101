def anagram?(word1, word2)
  #loop through second word; if char[index] count is same for both words,
  #continue
  #otherwise return fase
  word2.chars.each_with_index do |char, index|
    return false unless word2.chars.count(char) == word1.chars.count(char)
  end
  true
end

p anagram?('flow', 'fowl') == true
p anagram?('floppy', 'floopy') == false
p anagram?('', '') == true
p anagram?('tomato', 'potato') == false