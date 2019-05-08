def cleanup(stuff)
  alph = /[^a-zA-Z]+/
  stuff.gsub(alph, ' ')
end

p cleanup("---what's my +*& line?")