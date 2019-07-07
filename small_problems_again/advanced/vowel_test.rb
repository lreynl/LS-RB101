def rm_vowel(arr)
  vowels = /[aeiou]/i
  arr.map { |word| word.gsub(vowels, '') }
end

p rm_vowel(['red', 'orange', 'purple', 'chartreuse'])