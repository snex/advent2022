data = File.readlines(ARGV[0]).map(&:strip)

head_pos = 0+0i
knots = Array.new(9, Complex(0, 0))
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

    knots.each_with_index do |knot, i|
      prev = nil
      if i == 0
        prev = head_pos
      else
        prev = knots[i-1]
      end

      if (prev - knot).abs >= 2
        case prev - knot 
        when (2+0i)
          knots[i] += 1+0i
        when (-2+0i)
          knots[i] += -1+0i
        when (0+2i)
          knots[i] += 0+1i
        when (0-2i)
          knots[i] += 0-1i
        when (1+2i)
          knots[i] += 1+1i
        when (1-2i)
          knots[i] += 1-1i
        when (2+1i)
          knots[i] += 1+1i
        when (2-1i)
          knots[i] += 1-1i
        when (-1+2i)
          knots[i] += -1+1i
        when (-1-2i)
          knots[i] += -1-1i
        when (-2+1i)
          knots[i] += -1+1i
        when (-2-1i)
          knots[i] += -1-1i
        when (2+2i)
          knots[i] += 1+1i
        when (2-2i)
          knots[i] += 1-1i
        when (-2+2i)
          knots[i] += -1+1i
        when (-2-2i)
          knots[i] += -1-1i
        end

        if i == knots.size - 1
          tail_path.push(knots[i])
        end
      end
    end
  end
end

puts tail_path.uniq.size
