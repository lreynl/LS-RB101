def swapcase(str)
  str.chars.each do |char|
    if char == char.upcase
      char.downcase!
    else
      char.upcase!
    end
  end.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'