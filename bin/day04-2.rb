grid = ARGF.readlines.map do |line|
  line.chomp.split('').map { _1 == '@' }
end

def count_adjacent(grid, x, y)
  total = 0
  (-1..1).each do |i|
    (-1..1).each do |j|
      next if i.zero? && j.zero?
      next if (y + i).negative? || (x + j).negative?

      total += 1 if grid.dig(y + i, x + j)
    end
  end
  total
end

total_spots = 0

loop do
  round_spots = 0
  new_grid = grid.map(&:dup)
  grid.each_with_index do |row, y|
    row.each_with_index do |column, x|
      next unless column

      if count_adjacent(grid, x, y) < 4
        round_spots += 1
        new_grid[y][x] = false
      end
    end
  end

  break if round_spots.zero?

  total_spots += round_spots
  grid = new_grid
end

p total_spots
