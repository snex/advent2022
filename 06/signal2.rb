data = File.read(ARGV[0]).strip

data.chars.each_cons(14).with_index do |d, i|
  if d.uniq.size == 14
    puts i+14
    return
  end
end
