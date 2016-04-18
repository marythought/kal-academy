class Stack
  attr_accessor :array, :size

  def initialize
    @array = [nil, nil, nil, nil]
    @size = 0
  end

  def push(data)
    if @size == @array.length - 1
      @array.length.times do
        @array << nil
      end
    end
    array[@size + 1] = data
    @size += 1
  end

  def pop
    return "Stack is empty" if @size == 0
    obj = @array[@size]
    @array[@size] = nil
    @size -= 1
    obj
  end

  def to_s
    @array.compact.map(&:to_s)
  end

  def peek
    @array[@size]
  end

  # Reverse a stack and put the reversed value back in the same stack.
  # You can use only one other stack and a temp variable.
  def reverse!
    temp_stack = Stack.new
    reversed = 0
    count = @size
    # pop the top element to temp, then pop the rest into temp stack
    until reversed == count
      temp = pop
      (count - reversed - 1).times do
        temp_stack.push(pop)
      end
      push(temp)
      (count - reversed - 1).times do
        push(temp_stack.pop)
      end
      reversed += 1
    end
  end
end

def valid_parenthesis(expression)
  parens = Stack.new
  expression.each_char do |char|
    parens.push(char) if char == "("
    if char == ")"
      return "(" if parens.peek.nil?
      parens.pop
    end
  end
  return ")" unless parens.to_s.empty?
  "balanced"
end

# Evaluate an expression given only single digits and only 2 operators * and +.
# "2 + 4 * 5 * 3 + 1 + 2 * 4"

def simple_math(expression)
  numbers = Stack.new
  last = nil
  expression.each_char do |char|
    if char =~ /[1234567890]/
      if !last.nil?
        numbers.push(last * char.to_i)
        last = nil
      else
        numbers.push(char.to_i)
      end
    end
    last = numbers.pop if char == "*"
  end
  result = 0
  result += numbers.pop until numbers.peek.nil?
  result
end
