def pal?(str)
  str = str.gsub(/[^a-zA-Z0-9]/, '').downcase
  str = str.gsub(/[ ]/, ' ')
  str == str.reverse
end

p pal?('a man a plan a ca??nal panama')
p pal?('Satan Oscillate My Metallic Sonatas')
