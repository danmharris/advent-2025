require 'set'

Junction = Data.define(:x, :y, :z) do
  def distance_to(other)
    Math.sqrt((x - other.x).pow(2) + (y - other.y).pow(2) + (z - other.z).pow(2))
  end
end

Distance = Data.define(:a, :b, :dist) do
  def <=>(other)
    dist <=> other.dist
  end

  include Comparable
end

junctions = ARGF.readlines.map do |line|
  Junction.new(*line.split(',').map(&:to_i))
end

distances = junctions.combination(2).map do |a, b|
  Distance.new(a, b, a.distance_to(b))
end.sort

circuits = []

distances.take(1000).each do |distance|
  existing, cs = circuits.partition { _1.include?(distance.a) || _1.include?(distance.b) }

  cs << Set[distance.a, distance.b].merge(*existing)
  circuits = cs
end

p circuits.map(&:size).sort.reverse.take(3).reduce(1, &:*)
