problems = ARGF.readlines.map(&:split).transpose

total = problems.map do |problem|
  operator = problem.pop
  initial_value = operator == '*' ? 1 : 0

  problem.map(&:to_i).reduce(initial_value, &operator.to_sym)
end.sum

p total
