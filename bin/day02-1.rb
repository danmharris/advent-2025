ranges = ARGF.readline.split(',')

total = 0
ranges.each do |range|
  first, last = range.split('-')

  (first.to_i..last.to_i).each do |id|
    len = id.digits.size

    id_first = id.to_s[0, len / 2]
    id_last = id.to_s[len / 2..]

    total += id if id_first == id_last
  end
end

p total
