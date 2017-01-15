require "spec_helper"
require "arrays.rb"

describe 'question 1' do
  it "finds the single value in an array of increasing doubles in O(log n) time" do
    assert_equal 4, find_loner([1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8, 9, 9]), "works below the fold"
    assert_equal 7, find_loner([1, 1, 3, 3, 4, 4, 5, 5, 7, 8, 8]), "works above the fold"
    assert_equal 4, find_loner([1, 1, 3, 3, 4, 5, 5, 7, 7]), "works in the middle"
    assert_equal 1, find_loner([1, 3, 3, 4, 4, 5, 5, 7, 7, 8, 8]), "works for first number"
    assert_equal 8, find_loner([1, 1, 3, 3, 4, 4, 5, 5, 7, 7, 8]), "works for last number"
  end
end

describe 'question 2' do
  it "finds the magic index in an array of sorted distinct integers" do
    assert_equal 2, magic_index([-1, 0, 2, 5, 7]), "works for a magic array"
    assert_equal "no magic index", magic_index([23, 24, 25]), "works for no number"
    assert_equal 2, magic_index_binary([-1, 0, 2, 5, 7, 10, 12]), "binary search works for a magic array below the fold"
    assert_equal 5, magic_index_binary([-1, 0, 1, 2, 3, 5, 10, 200]), "binary search works for a magic array above the fold"
    assert_equal 5, magic_index_binary([-1, 0, 1, 2, 3, 5]), "binary search works for a magic array last #"
    assert_equal 0, magic_index_binary([0, 10, 20, 30, 35, 50, 100, 200]), "binary search works for a magic array first #"
    # assert_equal "no magic index", magic_index_binary([23, 24, 25, 100, 300]), "binary search works for no magic array"
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

describe 'question 4' do
  it 'finds a duplicate in an array 1 to n-1 with exactly 1 duplicate' do
    assert_equal 2, find_dup([1, 5, 4, 2, 3, 2])
    assert_equal 5, find_dup([1, 5, 4, 5, 3, 2])
    assert_equal 2, find_dup([1, 5, 4, 2, 3, 2, 6])
  end
  it 'finds a duplicate in an array 1 to n-1 with exactly 1 duplicate, in place' do
    assert_equal 2, find_dup_in_place([1, 5, 4, 2, 3, 2])
    assert_equal 5, find_dup_in_place([1, 5, 4, 5, 3, 2])
    assert_equal 2, find_dup_in_place([1, 5, 4, 2, 3, 2, 6])
  end
end

describe 'question 5' do
  it "identifies the index of an element in an ascending array" do
    assert_equal 7, adjacent_elements([8, 7, 6, 7, 6, 5, 4, 3, 2, 3, 4, 3], 3), "works in the middle"
    assert_equal 11, adjacent_elements([8, 7, 6, 7, 6, 5, 4, 5, 4, 5, 4, 3], 3), "works when last element"
    assert_equal 0, adjacent_elements([8, 7, 6, 7, 6, 5, 4, 3, 2, 3, 4, 3], 8), "works when first element"
  end
end

describe 'question 6' do
  it "returns two arrays when one element is the sum of the others" do
    assert_equal([[6], [1, 2, 3]], array_sum_additive([1, 2, 3, 6]), "with positive nums")
    assert_equal([[8], [-4, 5, -3, 10]], array_sum_additive([-4, 5, 8, -3, 10]), "with negative nums")
  end
  it "returns an empty array when an array does not fit the pattern" do
    assert_equal([], array_sum_additive([1, 2, 3, 7]), "array doesn't work")
    assert_equal([], array_sum_additive([]), "an empty array")
  end
end
