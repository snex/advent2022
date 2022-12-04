data = File.readlines(ARGV[0])

overlaps = 0

data.each do |d|
  s1, s2 = d.strip.split(',').map { |s| s.split('-')[0].to_i..(s.split('-')[1].to_i) }

  if (s1.begin <= s2.begin && s1.end >= s2.end) ||
      (s2.begin <= s1.begin && s2.end >= s1.end)
    overlaps += 1
  end
end

puts overlaps
