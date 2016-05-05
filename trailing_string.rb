# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    input_string, trail_string = line.split(",")
    match_index = input_string.length - trail_string.length
    puts input_string.rindex(trail_string) == match_index ? "1" : "0"
  end
end
