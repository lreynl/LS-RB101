hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each do |key, val|
  val.each { |word| puts word.chars.select { |char| /[aeiou]/i =~ char }.join }
end