BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
           'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
           'V' => 'I', 'L' => 'Y', 'Z' => 'M' }.freeze

def block_word?(word, blk = BLOCKS)
  blocks = blk.dup
  word.chars.each do |letter|
    if blocks.keys.include?(letter.upcase)
      blocks.delete(letter.upcase)
    elsif blocks.values.include?(letter.upcase)
      blocks.keys.each { |key| blocks.delete(key) if blocks[key] == letter.upcase }
    else
      return false
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true