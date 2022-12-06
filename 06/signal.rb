data = File.read(ARGV[0]).strip

data.chars.each_cons(4).with_index do |d, i|
  if d.uniq.size == 4
    puts i+4
    return
  end
end
