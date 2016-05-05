# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    digits = line.split("")
    permutations = digits.permutation.to_a.map(&:join).sort.uniq
    index = permutations.find_index(line)
    if index < permutations.size - 1
      puts permutations[index+1]
    else
      lowest = permutations[permutations.find_index { |d| d =~ /^[1-9]/ }]
      puts lowest.insert(1, "0")
    end
  end
end
