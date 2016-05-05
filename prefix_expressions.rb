class RPNCalculator
  # TODO: your code goes here!
  attr_reader :stack, :tokens

  def initialize
    @stack = []
  end

  def push(token)
    case token
    when "+", :+
      self.plus
    when "-", :-
      self.minus
    when "*", :*
      self.times
    when "/", ":", :/
      self.divide
    else
      @stack.push(token)
    end
  end

  def value
    if @stack.count > 0
      @stack.last
    else
      raise StandardError, "calculator is empty"
    end
  end

  def tokens(string)
    chars = string.split
    tokens = []
    chars.each do |token|
      number = token.to_i
      if number == 0 && token!="0" # not a number
        tokens << token.to_sym
      else
        tokens << number
      end
    end
    tokens
  end

  def evaluate(string)
    @tokens = self.tokens(string)
    @tokens.each { |token| self.push(token) }
    self.value
  end

  def plus
    if @stack.count > 1
      @stack.push(stack.pop + stack.pop)
    else
      raise StandardError, "calculator is empty"
    end
  end

  def minus
    if @stack.count > 1
      @stack.push(-stack.pop + stack.pop)
    else
      raise StandardError, "calculator is empty"
    end
  end

  def times
    if @stack.count > 1
      @stack.push(stack.pop * stack.pop)
    else
      raise StandardError, "calculator is empty"
    end
  end

  def divide
    if @stack.count > 1
      @stack.push(1.0/stack.pop * stack.pop)
    else
      raise StandardError, "calculator is empty"
    end
  end
end

calculator = RPNCalculator.new
# Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
  line.chomp!
  unless line.empty?
    puts calculator.evaluate(line.reverse)
  end
end
