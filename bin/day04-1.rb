grid = ARGF.readlines.map do |line|
  line.chomp.split('').map { _1 == '@' }
end

def count_adjacent(grid, x, y)
  total = 0
  (-1..1).each do |i|
    (-1..1).each do |j|
      next if i == 0 && j == 0
      next if (y + i).negative? || (x + j).negative?

      total += 1 if grid.dig(y + i, x + j)
    end
  end
  total
end

total_spots = 0

grid.each_with_index do |row, y|
  row.each_with_index do |column, x|
    next unless column

    total_spots += 1 if count_adjacent(grid, x, y) < 4
  end
end

p total_spots
