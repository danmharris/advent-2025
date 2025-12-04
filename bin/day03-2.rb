numbers = ARGF.readlines.map(&:to_i)

total = 0
numbers.each do |number|
  digits = number.digits.reverse
  12.times do |i|
    max_digit = digits[0..-(12 - i)].max
    total += 10**(12 - i - 1) * max_digit
    digits = digits[digits.index(max_digit) + 1..]
  end
end

p total
