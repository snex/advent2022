data = File.readlines(ARGV[0])

sum = 0
priorities = %w(
a b c d e f g h i j k l m n o p q r s t u v w x y z
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
)

data.each do |d|
  cp1, cp2 = d.chars.each_slice(d.length / 2).map(&:to_a)

  sum += priorities.index((cp1 & cp2)[0]) + 1
end

puts sum
