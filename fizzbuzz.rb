#=begin
# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    printout = ""
    first, second, final = line.split
    (1..final.to_i).each do |number|
      fizzbuzz = false
      item = ""
      if number % first.to_i == 0
        item += "F"
        fizzbuzz = true
      end
      if number % second.to_i == 0
        item += "B"
        fizzbuzz = true
      end
      item += number.to_s unless fizzbuzz
      printout << "#{item} "
    end
    puts printout.strip
  end
end
