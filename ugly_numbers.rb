# Sample code to read in test cases:
def is_ugly?(number)
  [2,3,5,7].each { |div| return true if number%div == 0 }
  false
end

# remove octal-format (leading 0)
def remove_octals(string)
  command = string
  string.gsub(/^0\d|\D0\d/) do |oct|
    dec = oct.sub("0", "")
    command = command.sub(oct, dec)
  end
  command
end

File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    count = 0
    n = line.length - 1
    number_of_variations = 3 ** n
    number_of_variations.times do |i|
      command = line[0]
      pattern = i.to_s(3).rjust(n, "0")
      line[1..-1].split("").each_with_index do |e, i|
        command << "+" if pattern[i] == "1"
        command << "-" if pattern[i] == "2"
        command << e
      end

      command = remove_octals(command)
      number = eval(command)
      count += 1 if is_ugly?(number)
    end
    puts count
  end
end
