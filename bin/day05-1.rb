fresh, available = ARGF.read.split("\n\n")

fresh = fresh.split("\n").map do |line|
  first, last = line.split('-').map(&:to_i)
  (first..last)
end
available = available.split("\n").map(&:to_i)

total = available.count do |i|
  fresh.any? { _1.include?(i) }
end

p total
