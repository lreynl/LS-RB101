def swap(phrase)
  phrase.split.map do |word|
    if word.length < 3
      word.reverse!
    else
      #last_char = word.slice!(-1)
      #first_char = word.slice!(0)
      #word = last_char + word + first_char
      #OR
      word = word.split('')
      word[0], word[-1] = word[-1], word[0]
      word = word.join('')
    end
  end
end

p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')