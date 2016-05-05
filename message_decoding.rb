# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    next unless line[-3,3] == "000"
    chars = line[0, line.length-3]
    rest = chars.reverse.match(/[01]*/).to_s.reverse
    header = chars[0..-rest.length-1]
    idx = nil
    message = []
    while idx.nil?
      key_length = rest[0, 3].to_i(2)
      pattern = "." * key_length
      keys = rest[3..-1].scan(/#{pattern}/)
      idx = keys.index("1" * key_length)
      if idx.nil?
        header += rest[0]
        rest = rest[1..-1]
      else
        message += keys[0...idx]
        rest = rest[3+(idx+1) * key_length..-1]
        break if rest.length < 5
        idx = nil
      end
    end
    decoded = ""
    message.each do |key|
      idx = key.to_i(2)
      (1...key.length).each { |n| idx += 2**n - 1 }
      decoded += header[idx]
    end
    puts decoded
  end
end
