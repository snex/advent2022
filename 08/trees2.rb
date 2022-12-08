data = File.readlines(ARGV[0]).map(&:strip).map { |l| l.chars.map { |c| c.to_i } }

trees = data.each_with_index.map do |row, i|
  row.each_with_index.map do |tree, j|
    if i == 0 || j == 0 || i == data.size - 1 || j == row.size - 1
      0
    else
      up_score = 0
      up_view = data[0..(i-1)].map { |d| d[j] }.reverse
      cur_biggest = 0
      up_view.each do |up_tree|
        next if cur_biggest >= tree
        cur_biggest = up_tree
        up_score += 1
      end

      down_score = 0
      down_view = data[(i+1)..(data.size-1)].map { |d| d[j] }
      cur_biggest = 0
      down_view.each do |down_tree|
        next if cur_biggest >= tree
        cur_biggest = down_tree
        down_score += 1
      end

      left_score = 0
      left_view = row[0..(j-1)].reverse
      cur_biggest = 0
      left_view.each do |left_tree|
        next if cur_biggest >= tree
        cur_biggest = left_tree
        left_score += 1
      end

      right_score = 0
      right_view = row[(j+1)..(row.size-1)]
      cur_biggest = 0
      right_view.each do |right_tree|
        next if cur_biggest >= tree
        cur_biggest = right_tree
        right_score += 1
      end

      up_score * down_score * right_score * left_score
    end
  end
end

puts trees.flatten.max
