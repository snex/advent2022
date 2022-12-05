stack, instructions = File.read(ARGV[0]).split("\n\n")

stacks = nil
stack.split("\n").reverse.each_with_index do |line, i|
  if i == 0
    stacks = line.split.each_with_object({}) { |id, h| h[id.to_i] = [] }
  else
    crates = line.scan(/(...) (...) (...)/).flatten
    crates.each_with_index do |crate, i|
      next if crate.squeeze == ' '
      stacks[i+1].push(crate)
    end
  end
end

instructions.split("\n").each do |inst|
  num_crates, source, dest = inst.scan(/move (.*) from (.*) to (.*)/).flatten

  num_crates.to_i.times do
    crate = stacks[source.to_i].pop
    stacks[dest.to_i].push(crate)
  end
end

puts stacks.values.map { |s| s.last.gsub('[', '').gsub(']', '') }.join
