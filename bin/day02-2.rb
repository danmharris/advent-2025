ranges = ARGF.readline.split(',')

total = 0
ranges.each do |range|
  first, last = range.split('-')

  (first.to_i..last.to_i).each do |id|
    len = id.digits.size
    (1..len / 2).each do |length|
      next unless (len % length).zero?

      pattern = id.to_s[0, length]

      if (pattern * (len / length)) == id.to_s
        total += id
        break
      end
    end
  end
end

p total
