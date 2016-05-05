# Sample code to read in test cases:
lines = []
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  lines << line unless line.empty?
end
output_size =  lines.shift.to_i
sorted = lines.sort { |a, b| b.length <=> a.length }
puts sorted[0...output_size]
