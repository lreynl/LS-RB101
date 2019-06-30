MAX_WIDTH = 76

def outer_line(width)
  puts '+' + '-' * (width + 2) + '+'
end

def inner_line(width)
  puts '|' + ' ' * (width + 2) + '|'
end

def text_line(text, width)
  line = '|' + ' ' + "#{text}"
  while width == MAX_WIDTH && line.length <= MAX_WIDTH + 2
    line << ' '
  end
  line << '|'
  print line
end

def print_text(text, width)
  text = text.split(' ')
  line = ''
  until text.empty?
    loop do
      if text.empty?
        puts text_line(line, width)
        break
      elsif line.length + text[0].length > MAX_WIDTH
        puts text_line(line, width)
        line = ''
      else
        line << text.shift << ' '
      end
    end
  end
end

def print_in_box(text)
  width = text.length > MAX_WIDTH ? MAX_WIDTH : text.length
  outer_line(width)
  inner_line(width)
  print_text(text, width)
  inner_line(width)
  outer_line(width)
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Modify this method so it will truncate the message if it will be ' \
             'too wide to fit inside a standard terminal window (80 columns, '   \
             'including the sides of the box). For a real challenge, try word '  \
             'wrapping very long messages so they appear on multiple lines, but '\
             'still within a box.')
print_in_box('If pattern is a String, then its contents are used as the ' \
           'delimiter when splitting str. If pattern is a single space, ' \
           'str is split on whitespace, with leading whitespace and runs ' \
           'of contiguous whitespace characters ignored. ' \
           'If pattern is a Regexp, str is divided where the pattern matches. '\
           'Whenever the pattern matches a zero-length string, str is split ' \
           'into individual characters. If pattern contains groups, the ' \
           'respective matches will be returned in the array as well.')
