manifold = ARGF.readlines.map { _1.chomp.split('') }
start = manifold.shift

def num_timelines(manifold, start_y, beam, cache = {})
  manifold.each_with_index do |line, y|
    next unless y >= start_y
    next unless line[beam] == '^'

    cache_res = cache[[y, beam]]
    return cache_res unless cache_res.nil?

    res = num_timelines(manifold, y, beam - 1, cache) + num_timelines(manifold, y, beam + 1, cache)
    cache[[y, beam]] = res
    return res
  end
  1
end

p num_timelines(manifold, 0, start.index('S'))
