require "spec_helper"
require "queues.rb"

describe 'A queue' do
  it "instantiates an empty queue of length 4, with enqueue and dequeue enabled" do
    myqueue = Queue.new
    assert_equal [nil, nil, nil, nil], myqueue.array, "an empty queue"
    myqueue.enqueue(1)
    assert_equal [1, nil, nil, nil], myqueue.array, "enqueue a value to 0 index"
    myqueue.enqueue(2)
    myqueue.enqueue(3)
    assert_equal [1, 2, 3, nil], myqueue.array, "enqueue a value to 2 index"
    assert_equal 1, myqueue.dequeue
    myqueue.enqueue(4)
    myqueue.enqueue(5)
    assert_equal [5, 2, 3, 4, nil, nil, nil, nil], myqueue.array, "should value when all space filled"
    assert_equal 2, myqueue.dequeue, "dequeue a value"
    assert_equal [5, nil, 3, 4, nil, nil, nil, nil], myqueue.array, "queue after dequeue "
    assert_equal 2, myqueue.head, "head after dequeue"
    assert_equal 1, myqueue.tail, "tail after dequeue"
    assert_equal 3, myqueue.count, "count after dequeue"
    myqueue.enqueue(6)
    assert_equal [5, 6, 3, 4, nil, nil, nil, nil], myqueue.array, "enqueues value at 1 index if available"
    assert_equal 4, myqueue.tail, "tail should be at 4"
    myqueue.enqueue(7)
    assert_equal [5, 6, 3, 4, 7, nil, nil, nil], myqueue.array, "replaces dequeue with nil and keeps length"
    # assert_equal ["1", "2", "3"], myqueue.to_s, "prints a string with nils removed"
    # assert_equal 3, myqueue.peek, "peeks the top value without removing it"
    # assert_equal [nil, 1, 2, 3, nil, nil, nil, nil], myqueue.array, "peeks the top value without removing it"
  end
end
