# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    string, substitutions = line.split(";")
    subs = substitutions.split(",")
    (0...subs.count/2).each do |idx|
      f = subs[2*idx]
      r = subs[2*idx+1].gsub(/0/, "2")
      r.gsub!(/1/, "3")
      string.gsub!(/#{f}/, r)
    end
    string.gsub!(/2/, "0")
    string.gsub!(/3/, "1")
    puts string
  end
end
