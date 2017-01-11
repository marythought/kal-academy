class Queue
  attr_accessor :array, :count

  def initialize
    @array = []
    @count = 0
  end

  def enqueue(value)
    @array << value
    @count += 1
  end

  def dequeue
    return "Queue is empty" if @count == 0
    @count -= 1
    @array.shift
  end

  def to_s
  end

  def peek
  end
end

def binary_nums(top_limit)
  binarys = Queue.new
  binarys.enqueue(1)
  loop do
    num = binarys.dequeue
    
  end
end
