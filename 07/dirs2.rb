data = File.readlines(ARGV[0]).map(&:strip)

class FakeFile
  attr_accessor :name, :size, :dir

  def initialize(name, size, dir)
    @name = name
    @size = size
    @dir = dir
  end
end

class FakeDir
  attr_accessor :name, :parent_dir, :files

  def initialize(name, parent_dir)
    @name = name
    @parent_dir = parent_dir
    @files = []
  end

  def fullname
    if parent_dir.nil?
      @name
    elsif parent_dir.fullname == '/'
      "/#{name}"
    else
      "#{parent_dir.fullname}/#{@name}"
    end
  end

  def size
    @files.sum(&:size)
  end
end

mode = nil
curdir = nil
dirs = []

data.each do |d|
  if d[0] == '$'
    _, cmd, arg = d.split

    if cmd == 'cd'
      mode = 'cd'

      if arg == '..'
        curdir = curdir.parent_dir
      else
        if arg == '/'
          parent_dir = nil
        else
          parent_dir = curdir
        end

        newdir = FakeDir.new(arg, parent_dir)

        if !dirs.empty?
          curdir.files.push(newdir)
        end

        dirs.push(newdir)
        curdir = newdir
      end
    elsif cmd == 'ls'
      mode = 'ls'
    end
  else
    if mode == 'ls'
      one, two = d.split
      if one == 'dir'
        next
      else
        f = FakeFile.new(two, one.to_i, curdir)
        curdir.files.push(f)
      end
    end
  end
end

total_disk = 70_000_000
total_needed = 30_000_000
total_used = dirs.first.size
total_unused = total_disk - total_used
req = total_needed - total_unused

puts "total used: #{total_used}"
puts "amt needed to be freed: #{req}"

sizes = dirs.map(&:size).sort

puts sizes.select { |s| s >= req }.first
