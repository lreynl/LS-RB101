def cleanup(str)
  non_alpha = /[^a-zA-Z]/
  spaces = /\s{2,}/
  str = str.gsub(non_alpha, ' ')
  str = str.gsub(spaces, ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
