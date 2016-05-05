class Fixnum
  def in_words
    return "ZeroDollars" if self == 0
    # return "OneDollar" if self == 1

    thousands = self.split_in_thousands
    word = ""
    thousands.each do |key, value|
      word += "#{value.attach_powers(key)}"
    end
    word += "Dollars"
  end

  def split_in_thousands
    remainder = self
    thousands = {}
    power = 12
    while power > 1
      break unless remainder > 0
      multiple, remainder = remainder.power_divmod(10, power)
      thousands[power] = multiple if multiple > 0
      power -= 3
    end
    thousands[0] = remainder if remainder > 0
    thousands
  end

  def power_divmod(base, power = 1)
    divisor = base ** power
    self.divmod(divisor)
  end

  def convert_hundreds
    basics = { 1 => "One", 2 => "Two", 3 => "Three",
               4 => "Four", 5 => "Five", 6 =>"Six", 7 => "Seven",
               8 => "Eight", 9 => "Nine", 10 => "Ten",
              11 => "Eleven", 12 => "Twelve", 13 => "Thirteen",
              14 => "Fourteen", 15 => "Fifteen", 16 => "Sixteen",
              17 => "Seventeen", 18 => "Eighteen", 19 => "Nineteen" }
    tens = { 2 => "Twenty", 3 => "Thirty",
             4 => "Forty", 5 => "Fifty", 6 => "Sixty",
             7 => "Seventy", 8 => "Eighty", 9 => "Ninety" }

    prefix = ""
    multiple, remainder = self.divmod(100)
    prefix = "#{basics[multiple]}Hundred" if multiple > 0

    if remainder < 20
      prefix += "#{basics[remainder]}"
    else
      prefix += "#{tens[remainder/10]}"
      remainder %= 10
      prefix += "#{basics[remainder]}" if basics.has_key?(remainder)
    end

    prefix
  end

  def attach_powers(power)
    powers = { 3 => "Thousand", 6 => "Million",
               9 => "Billion", 12 => "Trillion" }

    word = ""
    word += self.convert_hundreds
    word += "#{powers[power]}" if powers.has_key?(power)
    word
  end
end

# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    puts line.to_i.in_words
  end
end
