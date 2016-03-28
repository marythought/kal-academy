require "spec_helper"
require "arrays.rb"

describe 'question 1' do
  it "finds the single value in an array of increasing doubles in O(log n) time" do
    assert_equal 4, find_loner([1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8]), "works in the middle"
    assert_equal 1, find_loner([1, 3, 3, 4, 4, 5, 5, 7, 7, 8, 8]), "works for first number"
    assert_equal 8, find_loner([1, 1, 3, 3, 4, 4, 5, 5, 7, 7, 8]), "works for last number"
  end
end

describe 'question 2' do
  it "finds the magic index in an array of sorted distinct integers" do
    skip
    assert_equal 0, magic_index([0, 1, 2, 3, 4, 5, 6, 7, 8]), "works for an odd array"
    assert_equal 5, magic_index([0, 1, 2, 3, 4, 5, 6, 7]), "works for an even array"
  end
end

describe 'question 3' do
  it "finds the position of an element in a sorted and rotated array" do
    assert_equal 2, find_element_index_consecutive([3, 4, 5, 6, 0, 1, 2], 5)
    assert_equal 5, find_element_index([3, 4, 5, 6, 0, 1, 2], 1)
    assert_equal 1, find_element_index([10, 13, 15, 0, 0, 2, 5], 13)
    assert_equal 3, find_element_index([10, 13, 15, 0, 0, 2, 5], 0), "finds the lowest index for duplicate"
    assert_equal 0, find_element_index([10, 13, 15, 0, 0, 2, 5], 10), "works for 0 index"
    assert_equal 6, find_element_index([10, 13, 15, 0, 0, 2, 5], 5), "works for -1 index"
  end
end
