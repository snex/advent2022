data = File.read(ARGV[0]).split("\n\n")
best = 0

totals = []

data.each do |d|
  totals << d.split("\n").map { |i| i.to_i }.sum
end

puts totals.sort { |a, b| b <=> a }[0..2].sum
