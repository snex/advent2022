data = File.readlines(ARGV[0])

move_map = {
  'A' => :rock,
  'B' => :paper,
  'C' => :scissors
}

res_map = {
  'X' => :lose,
  'Y' => :draw,
  'Z' => :win
}

total = 0

data.each do |d|
  villain_play, res = move_map[d.split[0]], res_map[d.split[1]]
  puts "v: #{villain_play}, r: #{res}"
  total += case villain_play
           when :rock
             case res
             when :win
               6 + 2
             when :lose
               0 + 3
             when :draw
               3 + 1
             end
           when :paper
             case res
             when :win
               6 + 3
             when :lose
               0 + 1
             when :draw
               3 + 2
             end
           when :scissors
             case res
             when :win
               6 + 1
             when :lose
               0 + 2
             when :draw
               3 + 3
             end
           end
end

puts total
