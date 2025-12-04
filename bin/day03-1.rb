numbers = ARGF.readlines.map(&:to_i)

total = 0
numbers.each do |number|
  digits = number.digits.reverse
  first = digits[...-1].max
  remaining = digits[digits.index(first) + 1..]
  second = remaining.max

  total += (10 * first) + second
end

p total
