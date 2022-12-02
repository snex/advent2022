data = File.readlines(ARGV[0])

move_map = {
  'A' => :rock,
  'B' => :paper,
  'C' => :scissors,
  'X' => :rock,
  'Y' => :paper,
  'Z' => :scissors
}

total = 0

data.each do |d|
  villain_play, hero_play = d.split.map { |p| move_map[p] }
  puts "v: #{villain_play}, h: #{hero_play}"
  total += case hero_play
           when :rock
             case villain_play
             when :rock
               1 + 3
             when :paper
               1 + 0
             when :scissors
               1 + 6
             end
           when :paper
             case villain_play
             when :rock
               2 + 6
             when :paper
               2 + 3
             when :scissors
               2 + 0
             end
           when :scissors
             case villain_play
             when :rock
               3 + 0
             when :paper
               3 + 6
             when :scissors
               3 + 3
             end
           end
end

puts total
