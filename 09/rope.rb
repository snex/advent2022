data = File.readlines(ARGV[0]).map(&:strip)

head_pos = tail_pos = Complex(0, 0)
tail_path = [0+0i]

data.each do |d|
  dir, steps = d.split
  val = 0+0i
  case dir
  when 'R'
    val = 1+0i
  when 'L'
    val = -1+0i
  when 'D'
    val = 0-1i
  when 'U'
    val = 0+1i
  end

  steps.to_i.times do
    head_pos += val
    if (head_pos - tail_pos).abs >= 2
      case head_pos - tail_pos
      when (2+0i)
        tail_pos += 1+0i
      when (-2+0i)
        tail_pos += -1+0i
      when (0+2i)
        tail_pos += 0+1i
      when (0-2i)
        tail_pos += 0-1i
      when (1+2i)
        tail_pos += 1+1i
      when (1-2i)
        tail_pos += 1-1i
      when (2+1i)
        tail_pos += 1+1i
      when (2-1i)
        tail_pos += 1-1i
      when (-1+2i)
        tail_pos += -1+1i
      when (-1-2i)
        tail_pos += -1-1i
      when (-2+1i)
        tail_pos += -1+1i
      when (-2-1i)
        tail_pos += -1-1i
      end

      tail_path.push(tail_pos)
    end
  end
end

puts tail_path.uniq.size
