require "spec_helper"
require "queues.rb"

describe 'A queue' do
  it "instantiates an empty queue of length 4, with enqueue and dequeue enabled" do
    myqueue = Queue.new
    assert_equal [], myqueue.array, "an empty queue"
    myqueue.enqueue(1)
    assert_equal [1], myqueue.array, "enqueue a value to 0 index"
    myqueue.enqueue(2)
    myqueue.enqueue(3)
    assert_equal [1, 2, 3], myqueue.array, "enqueue a value to 2 index"
    assert_equal 1, myqueue.dequeue
    myqueue.enqueue(4)
    myqueue.enqueue(5)
    assert_equal 2, myqueue.dequeue, "dequeue a value"
    assert_equal [3, 4, 5], myqueue.array, "queue after dequeue "
    assert_equal 3, myqueue.count, "count after dequeue"
    myqueue.enqueue(6)
    assert_equal [3, 4, 5, 6], myqueue.array, "queue after enqueue"
  end

  
end
