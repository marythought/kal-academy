require "spec_helper"
require "stacks.rb"

describe 'A stack' do
  it "instantiates an empty stack of length 4, with push and pop enabled" do
    mystack = Stack.new
    assert_equal [nil, nil, nil, nil], mystack.array, "an empty stack"
    mystack.push(1)
    assert_equal [nil, 1, nil, nil], mystack.array, "push a value to 1 index"
    mystack.push(2)
    assert_equal [nil, 1, 2, nil], mystack.array, "push a value to 2 index"
    mystack.push(3)
    assert_equal [nil, 1, 2, 3], mystack.array, "push a value to 3 index"
    mystack.push(4)
    assert_equal [nil, 1, 2, 3, 4, nil, nil, nil], mystack.array, "it should double on 4th index"
    assert_equal 4, mystack.pop, "pop a value"
    assert_equal [nil, 1, 2, 3, nil, nil, nil, nil], mystack.array, "replaces pop with nil and keeps length"
    assert_equal ["1", "2", "3"], mystack.to_s, "prints a string with nils removed"
    assert_equal 3, mystack.peek, "peeks the top value without removing it"
    assert_equal [nil, 1, 2, 3, nil, nil, nil, nil], mystack.array, "peeks the top value without removing it"
  end
end

describe 'stack exercises' do
  it 'can find the missing parenthesis' do
    assert_equal ")", valid_parenthesis("– 2 * ( 3 + 5(sasdfasdfasd)"), "finds missing close"
    assert_equal "(", valid_parenthesis("())"), "finds missing open"
    assert_equal "balanced", valid_parenthesis("(2 + 3) * (3 / 4)"), "finds balanced"
  end

  it 'can do some simple math' do
    assert_equal 20, simple_math("2 + 3 * 4 + 2 * 3")
    assert_equal 32, simple_math("2 + 3 * 4 * 2 + 2 * 3")
    assert_equal 13, simple_math("1 + 2 + 3 + 7")
    assert_equal 24, simple_math("1 * 3 * 4 * 2")
  end

  it 'a function to reverse a stack' do
    mystack = Stack.new
    mystack.push(1)
    mystack.push(2)
    mystack.push(3)
    mystack.push(4)
    mystack.push(5)
    mystack.reverse!
    assert_equal [nil, 5, 4, 3, 2, 1, nil, nil], mystack.array
    mystack.reverse!
    assert_equal ["1", "2", "3", "4", "5"], mystack.to_s
  end
end
