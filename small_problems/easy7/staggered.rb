def alt_caps(str, start_with_cap = true, ignore = true)
  match = ignore ? /[a-z]/i : /./
  str.chars.each do |char|
    if start_with_cap && match =~ char
      char.upcase!
      start_with_cap = !start_with_cap
    elsif match =~ char
      char.downcase!
      start_with_cap = !start_with_cap
    end
  end.join
end

p alt_caps('I Love Launch School!')
p alt_caps('ALL_CAPS')
p alt_caps('ignore 77 the 444 numbers')

p alt_caps('I Love Launch School!', false)
p alt_caps('ALL_CAPS', false)
p alt_caps('ignore 77 the 444 numbers', false)
p alt_caps('a1b2c3d4e5')
p alt_caps('a1b2c3d4e5', false)
puts ''
p alt_caps('I Love Launch School!', false, false)
p alt_caps('ALL_CAPS', false, false)
p alt_caps('ignore 77 the 444 numbers', true, false)
p alt_caps('a1b2c3d4e5',true, false)
p alt_caps('a1b2c3d4e5', false, true)