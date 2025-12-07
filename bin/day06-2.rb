sheet = ARGF.readlines
operators = sheet.pop.split.reverse

numbers = sheet.map { _1.chomp.split('') }.transpose.reverse
numbers.push([' '])

total = 0
current_numbers = []

numbers.each do |number|
  if number.any? { _1 != ' ' }
    current_numbers << number.join.to_i
    next
  end

  operator = operators.shift

  initial_value = operator == '*' ? 1 : 0

  total += current_numbers.reduce(initial_value, &operator.to_sym)
  current_numbers.clear
end

p total
