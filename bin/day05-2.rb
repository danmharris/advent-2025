fresh, = ARGF.read.split("\n\n")

fresh = fresh.split("\n").map do |line|
  first, last = line.split('-').map(&:to_i)
  (first..last)
end

changed = true
while changed
  changed = false
  new_fresh = fresh.dup

  fresh.each do |f|
    overlaps = fresh.find { _1.overlap?(f) && _1 != f }
    next if overlaps.nil?

    min = [f.min, overlaps.min].min
    max = [f.max, overlaps.max].max

    new_fresh.delete(f)
    new_fresh.delete(overlaps)
    new_fresh << (min..max)
    changed = true
    fresh = new_fresh
    break
  end
end

p fresh.uniq.map(&:count).sum
