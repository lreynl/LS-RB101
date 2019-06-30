def staggered_case(str, option = true)
  upcase = true
  option ? char_type = /[a-z]/i : char_type = /[.]/
  str.chars.each_with_index do |char, index|
    if char =~ char_type
      if upcase
        char.upcase!
      else
        char.downcase!
      end
      upcase = !upcase
    end
  end.join('')
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'