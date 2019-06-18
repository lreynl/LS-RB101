BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
           'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
           'V' => 'I', 'L' => 'Y', 'Z' => 'M' }.freeze

def can_spell?(block_list, word)
  blocks = block_list.dup
  word.upcase.split('').each do |letter|
    if blocks.keys.include?(letter) || blocks.values.include?(letter)
      blocks.delete(letter)
      blocks.delete(blocks.key(letter))
    else
      return false
    end
  end
  true
end

puts can_spell?(BLOCKS, 'batch')
puts can_spell?(BLOCKS, 'butch')
puts can_spell?(BLOCKS, 'jest')