# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    input_string, rm_string = line.split(", ")
    rm_chars = rm_string.strip
    output_string  = input_string.delete(rm_chars)
    puts output_string.strip
  end
end
