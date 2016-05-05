# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    string1, string2 = line.split(";")
    string1, string2 = string2, string1 if string1.length < string2.length
    return string2 if string1.include?(string2)
    common = string1.split("") & string2.split("")
    if common.empty?
      puts ""
      next
    end
    if common.length < 2
      puts common[0]
      next
    end
    comparator = string2.scan(/[#{common}]/)
    
  end
end
