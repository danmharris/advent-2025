instructions = ARGF.readlines.map do |line|
  line.chomp!
  [line.slice(0), line.slice(1..).to_i]
end

pos = 50
zeroes = 0
instructions.each do |direction, amount|
  curr_round = pos / 100

  case direction
  when 'L'
    curr_round -= 1 if (pos % 100).zero?
    pos -= amount
    zeroes += 1 if (pos % 100).zero?
  when 'R'
    pos += amount
  end

  new_round = pos / 100

  zeroes += (curr_round - new_round).abs if new_round != curr_round
end

p zeroes
