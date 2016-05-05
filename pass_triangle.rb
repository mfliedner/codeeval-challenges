# Sample code to read in test cases:
accumulator = [[0]]
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    row = line.split
    previous = accumulator
    accumulator = Array.new(row.count) { [] }
    row.each_with_index do |item, i|
      number = item.to_i
      if i > 0
        previous[i-1].each { |sum| accumulator[i].push(sum + number) }
      end
      if i < previous.count
        previous[i].each { |sum| accumulator[i].push(sum + number) }
      end
      max = 0
      accumulator[i].each { |number| max = number if number > max }
      accumulator[i] = [max]
    end
  end
end

max = 0
accumulator.each { |number| max = number.first if number.first > max }
puts max
