instructions = ARGF.readlines.map do |line|
  line.chomp!
  [line.slice(0), line.slice(1..).to_i]
end

pos = 50
zeroes = 0
instructions.each do |direction, amount|
  case direction
  when 'L'
    pos -= (amount % 100)
    pos += 100 if pos.negative?
  when 'R'
    pos = (pos + amount) % 100
  end

  zeroes += 1 if pos.zero?
end

p zeroes
