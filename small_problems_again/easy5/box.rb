MAX_WIDTH = 76

def outer_line(width)
  '+' + '-' * (width + 2)  + '+'
end

def inner_line(width)
  '|' + ' ' * (width + 2) + '|'
end

def text_line(text, width)
  '|' + ' ' + "#{text}" + '|'
end

def print_in_box(text)
  width = 0
  text.length > MAX_WIDTH ? width = MAX_WIDTH : width = text.length
  puts outer_line(width)
  puts inner_line(width)
  text = text.split(' ')
  line = ''
  while !text.empty?
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
  puts inner_line(width)
  puts outer_line(width)
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Modify this method so it will truncate the message if it will be' \
             'too wide to fit inside a standard terminal window (80 columns,'   \
             'including the sides of the box). For a real challenge, try word'  \
             'wrapping very long messages so they appear on multiple lines, but'\
             'still within a box.')
