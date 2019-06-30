def swap_name(str)
  str = str.split(' ')
  str[0], str[1] = str[1], str[0]
  str[0] << ','
  str.join(' ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
