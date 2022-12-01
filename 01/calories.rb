data = File.read(ARGV[0]).split("\n\n")
best = 0

data.each do |d|
  total = d.split("\n").map { |i| i.to_i }.sum
  if total > best
    best = total
  end
end

puts best
