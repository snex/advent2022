data = File.readlines(ARGV[0])

sum = 0
priorities = %w(
a b c d e f g h i j k l m n o p q r s t u v w x y z
A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
)

data.each_slice(3) do |d|
  common = d[0].chars & d[1].chars & d[2].chars
  sum += priorities.index(common[0]) + 1
end

puts sum
