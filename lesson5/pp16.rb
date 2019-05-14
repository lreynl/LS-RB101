def uuid
  uuid = ''
  hex = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  pattern = [8, 4, 4, 4, 12]
  index = 0
  pattern.each do |num|
    while index < pattern.length
    num.times do
      uuid << hex.sample
    end
    uuid << '-' unless index == pattern.length - 1
    index += 1
    end
  end
  uuid
end

p uuid