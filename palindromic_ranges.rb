# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    lower, upper = line.split
    l = lower.to_i
    r = upper.to_i
    palindromes = []
    (l..r).each { |i| palindromes << i if i.to_s == i.to_s.reverse }
    indices = (l..r).to_a
    ranges = indices.product(indices).reject { |i,j| i > j }
    range_count = 0
    ranges.each do |pair|
      interesting = 0
      palindromes.each { |n| interesting += 1 if n.between?(pair.first, pair.last) }
      range_count += 1 if interesting.even?
    end
    puts range_count
  end
end
