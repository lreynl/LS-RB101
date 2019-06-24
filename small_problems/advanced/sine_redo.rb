def sine(amp, num = 1)
  line = ''
  wave = ''
  pi_2 = Math::PI / 2
  amp_f = amp.to_f
  amp.downto(0) do |y|
    a = Math.asin(y * (1 / amp_f))
    line += ' ' * ((a / pi_2) * amp_f).round
    line += '*'
    line += ' ' * (amp_f - ((a / pi_2) * amp_f).round)
    line += line.reverse
    line += ' ' * (amp * 2 + 1)
    num.round.times do
      wave += line
    end
    wave += "\n"
    line = ''
  end
  wave + wave.chomp.reverse
end

puts sine(5, 3)
puts sine(10, 3)
