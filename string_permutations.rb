# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    characters = line.split("")
    permutations = characters.permutation.to_a.map(&:join).sort
    puts permutations.join(",")
  end
end
