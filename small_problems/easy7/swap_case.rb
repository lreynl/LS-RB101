def swap_case(str)
  str.chars.each do |char| 
    if /[a-z]/.match(char)
      char.upcase!
    elsif /[A-Z]/.match(char)
      char.downcase!
    end
  end.join
end

p swap_case('CamelCase')
p swap_case('Tonight on XYZ-TV')