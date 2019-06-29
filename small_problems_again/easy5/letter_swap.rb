def swap_first_last(str)
  return str if str.length == 1
  str.split(' ').map do |word|
    word = word.split('')
    word[0], word[-1] = word[-1], word[0]
    word.join('')
  end.join(' ')
end

p swap_first_last('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap_first_last('Abcde') == 'ebcdA'
p swap_first_last('a') == 'a'