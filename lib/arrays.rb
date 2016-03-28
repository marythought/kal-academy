# 1. Find the element that appears once in a sorted array where all other elements appear twice one after another. Find that element in 0(logn) complexity.
# Input: arr[] = {1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8}
# Output: 4

# 0(log n) method, non-destructive & does not require any additional memory
def find_loner(array)
  (array.length / 2).times do |i|
    i *= 2
    return array[i] if array[i] != array[i + 1]
  end
  array[-1]
end

# 2. A magic index in an array A[0...n-1] is defined to be an index such that
# A[i] = i. Given a sorted array of distinct integers, write a method to find
# a magic index if one exists, in an array A.
# FOLLOW UP: What if the values are not distinct?

def magic_index(_array)
  0
end

# 3. Given a sorted array of n integers that has been rotated an unknown
# number of times, write code to find an element in the array. You may assume
# that the array was originally sorted in increasing order.
# [3, 4, 5, 6, 0, 1, 2], 5
def find_element_index_consecutive(array, ele)
  index = ele - array[0]
  index = index < 0 ? array.length + index : index
  index
end

def find_element_index(array, ele)
  if ele >= array[0]
    index = 0
    loop do
      return index if ele == array[index]
      index += 1
    end
  else
    index = -1
    loop do
      match = array.length + index if ele == array[index]
      return match if match && array[index - 1] != array[index]
      index -= 1
    end
  end
end

# 4. Given an array that contains numbers from 1 to n-1 and exactly 1 duplicate,
# find that duplicate.

# 5. Search an element in an array where difference between adjacent
# elements is 1.
# For example: arr[] = {8, 7, 6, 7, 6, 5, 4, 3, 2, 3, 4, 3}
# Search for 3 and Output: Found at index 7

# 6. Given an array of numbers, split the array into two where one array
# contains the sum of n-1 numbers & the other array with all the n-1 elements.
