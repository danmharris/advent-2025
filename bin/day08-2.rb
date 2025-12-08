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

circuits = junctions.map { Set[_1] }

distances.each do |distance|
  existing, cs = circuits.partition { _1.include?(distance.a) || _1.include?(distance.b) }

  if cs.empty?
    p(distance.a.x * distance.b.x)
    break
  end

  cs << Set[].merge(*existing)
  circuits = cs
end
