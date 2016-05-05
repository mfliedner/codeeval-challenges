# Sample code to read in test cases:
def closest(points)
  closest = Float::INFINITY
  points.each_with_index do |point1, i|
    points[i+1..-1].each do |point2|
      distance = (point1[0] - point2[0])**2 + (point1[1] - point2[1])**2
      closest = distance < closest ? distance : closest
    end
  end
  Math.sqrt(closest)
end

points = []
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    pair = line.split
    if pair.count == 1
      n = pair[0].to_i
      if n == 0
        distance = closest(points)

        if distance < 10000.0
          puts sprintf('%.4f', distance)
        else
          puts "INFINITY"
        end

        points = []
      end
    else
      points << [pair[0].to_f, pair[1].to_f]
    end
  end
end
