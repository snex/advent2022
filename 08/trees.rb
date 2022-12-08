data = File.readlines(ARGV[0]).map(&:strip).map { |l| l.chars.map { |c| c.to_i } }

trees = data.each_with_index.map do |row, i|
  row.each_with_index.map do |tree, j|
    if i == 0 || j == 0 || i == data.size - 1 || j == row.size - 1
      1
    elsif data[0..(i-1)].map { |d| d[j] }.all? { |t| t < tree }
      1
    elsif data[(i+1)..(data.size-1)].map { |d| d[j] }.all? { |t| t < tree }
      1
    elsif row[0..(j-1)].all? { |t| t < tree }
      1
    elsif row[(j+1)..(row.size-1)].all? { |t| t < tree }
      1
    else
      0
    end
  end
end

puts trees.flatten.select { |t| t == 1 }.size
