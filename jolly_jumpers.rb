# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    series = line.split
    n = series.shift.to_i
    if n == 1
      puts "Jolly"
      next
    end
    diffs = []
    series[0...-1].each_with_index { |d, i| diffs << (d.to_i - series[i+1].to_i).abs }
    if diffs.uniq.sort == (1...n).to_a
      puts "Jolly"
    else
      puts "Not jolly"
    end
  end
end
