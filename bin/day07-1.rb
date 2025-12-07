require 'set'

manifold = ARGF.readlines.map { _1.chomp.split('') }
start = manifold.shift

beams = Set[start.index('S')]

splits = 0
manifold.each do |line|
  new_beams = beams.dup

  beams.each do |beam|
    next unless line[beam] == '^'

    new_beams << beam - 1 if beam > 0
    new_beams << beam + 1 if beam < start.size - 1
    new_beams.delete(beam)
    splits += 1
  end
  beams = new_beams
end

p splits
