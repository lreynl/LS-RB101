def repeat(str)
  str.chars.map do |char| 
    if /[bcdfghjklmnpqrstvwxyz]/i =~ char 
      char * 2
    else
      char
    end
  end.join
end

p repeat('hello')
p repeat('')
p repeat('abc123')