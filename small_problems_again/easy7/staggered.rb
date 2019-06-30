def staggered_case(str, arg = true)
  str.chars.each_with_index do |char, index|
    if arg
      char.upcase! if index.even?
      char.downcase! if index.odd?
    else
      char.downcase! if index.even?
      char.upcase! if index.odd?
    end
  end.join('')
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'