# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    indices = (0...line.length).to_a
    ranges = indices.product(indices).reject { |i,j| i > j || (j-i+1) > line.length / 2 }
    subsall = ranges.map { |i,j| line[i..j] }.uniq
    previous = 0
    size = 0
    output_string = ""
    subsall.each do |subs|
      next if subs.strip.empty?
      size = subs.length if line.scan(/#{subs}/).count > 1
      if size > previous
        previous = size
        output_string = subs
      end
    end
    if output_string.strip.empty?
      puts "NONE"
    else
      puts output_string
    end
  end
end
