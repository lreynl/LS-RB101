def word_sizes(str)
  hash = {}
  non_alpha = /[^a-zA-Z]/
  str.split(' ').each do |word|
    word = word.gsub(non_alpha, '')
    len = word.length
    hash[len] ||= 0
    hash[len] += 1
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
