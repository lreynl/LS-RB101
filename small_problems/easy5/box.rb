MAX_TEXT_WIDTH = 76

def outer(len)
  puts '+' + '-' * (len + 2) + '+'
end

def inner(len)
  puts '|' + ' ' * (len + 2) + '|'
end

def text_line(text, split = false)
  text.slice!(0) if text[0] == ' '
  puts '|' + text.center(text.length + 2) + '|' unless split
  puts '|' + text.center(MAX_TEXT_WIDTH + 2) + '|' if split
end

def split_text(text)
  copy = text
  until copy.length.zero?
    index_of_last_sp = if copy.length > MAX_TEXT_WIDTH
                         copy.rindex(' ', MAX_TEXT_WIDTH - 1)
                       else
                         -1
                       end
    text_line(copy.slice!(0..index_of_last_sp), true)
  end
end

def put_in_box(text)
  len = text.length > MAX_TEXT_WIDTH ? MAX_TEXT_WIDTH : text.length
  outer(len)
  inner(len)
  if text.length > MAX_TEXT_WIDTH
    split_text(text)
  else
    text_line(text)
  end
  inner(len)
  outer(len)
end

put_in_box('Stuff here.')
put_in_box('To boldly go where no one has gone before.')
put_in_box('')

put_in_box('If pattern is a String, then its contents are used as the ' \
           'delimiter when splitting str. If pattern is a single space, ' \
           'str is split on whitespace, with leading whitespace and runs ' \
           'of contiguous whitespace characters ignored. ' \
           'If pattern is a Regexp, str is divided where the pattern matches. '\
           'Whenever the pattern matches a zero-length string, str is split ' \
           'into individual characters. If pattern contains groups, the ' \
           'respective matches will be returned in the array as well.')
