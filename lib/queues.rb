class Queue
  attr_accessor :array, :head, :tail, :count

  def initialize
    @array = [nil, nil, nil, nil]
    @count = 0
    @tail = 0
    @head = 0
  end

  def enqueue(value)
    @array[@tail] = value
    @count += 1
    if @count == @array.length
      # increase capacity by doubling array length
      @array.length.times do
        @array << nil
      end
    end
    @tail = (@tail + 1) % @array.length
    puts @tail
  end

  def dequeue
    return "Queue is empty" if @count == 0
    @count -= 1
    obj = @array[@head]
    @array[@head] = nil
    @head = (@head + 1) % @array.length
    obj
  end

  def to_s
  end

  def peek
  end
end
