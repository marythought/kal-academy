# 1. Find the element that appears once in a sorted array where all other
# elements appear twice one after another. Find that element in 0(logn) complexity.
# Input: arr[] = {1, 1, 3, 3, 4, 5, 5, 7, 7, 8, 8}
# Output: 4

def find_loner(array)
  return nil if array.length.even?
  low = 0
  high = array.length #11
  mid = (low + high) / 2 # 5 = 0 + 11 / 2
  until high == low
    if mid.even?
      # even index, should match # to its right unless loner has occured
      if array[mid] == array[mid + 1]
        # loner has NOT yet occured. disregard everything to the left
        low = mid + 2
      else
        # loner has been here. disregard everything to the right.
        high = mid
      end
    elsif array[mid] == array[mid - 1]
      # loner has NOT yet occured. disregard everything to the left!
      low = mid + 1
    else
      # loner has been here. disregard everything to the right.
      high = mid
    end
    mid = (low + high) / 2
  end
  array[mid]
end

# 2. A magic index in an array A[0...n-1] is defined to be an index such that
# A[i] = i. Given a sorted array of distinct integers, write a method to find
# a magic index if one exists, in an array A.
# FOLLOW UP: What if the values are not distinct?

def magic_index(array)
  array.each_with_index do |val, index|
    return index if val == index
  end
  "no magic index"
end

# DONE: followup with binary search, if value > index then quit
def magic_index_binary(array)
  low = 0
  high = array.length #6
  mid = (low + high) / 2 #3
  loop do
    # if array[mid] == 0 && array[0] != 0
    #   return "no magic array"
    if array[mid] > mid
      # value at array[mid] is 5. 5 is greater than 3. So nothing to the right can be a magic index. We could still have one to the left.
      high = mid #1
      mid = (low + high) / 2 #0
    elsif array[mid] < mid
      # Nothing to the left can be a magic index. We could still have one to the right.
      low = mid
      mid = (low + high) / 2
    elsif array[mid] == mid
      return mid
    else
      break
    end
  end
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
  elsif ele <= array[0]
    index = -1
    loop do
      match = array.length + index if ele == array[index]
      return match if match && array[index - 1] != array[index]
      index -= 1
    end
  end
end

# TODO: redo, with binary search
# find the midpoint, compare with target. 2 is less than 7. assumption is to
# go to the left, but the array has been ROTATTED. so... look at the leftmost element (4)
# and compare with target. 4 is greater than 2, so we can THROW OUT the entire leftmost
# side. look at the last element on the right, if it's greater than the value, then the taregt
# is somewhere in there

# 4. Given an array that contains numbers from 1 to n-1 and exactly 1 duplicate,
# find that duplicate.
# ex [1, 5, 4, 2, 3, 2]
def find_dup(array)
  # 17 - (1 + 2 + 3 + 4 + 5) = 2 --- total in this array minus total if there were no dupes
  array.reduce(&:+) - (1..(array.length - 1)).reduce(&:+)
end

def find_dup_in_place(array)
  dup = array.pop
  array.each_with_index do |value, index|
    dup += value - (index + 1) unless (index + 1).nil?
  end
  dup
end

# 5. Search an element in an array where difference between adjacent
# elements is 1.
# For example: arr = [8, 7, 6, 7, 6, 5, 4, 3, 2, 3, 4, 3]
# Search for 3 and Output: Found at index 7
def adjacent_elements(array, element)
  current_index = 0
  until array[current_index] == element or (current_index >= array.length - 1)
    next_move = (array[current_index] - element).abs #5
    current_index += next_move
  end
  current_index
end

# 6. Given an array of numbers, split the array into two where one array
# contains the sum of n-1 numbers & the other array with all the n-1 elements.
# example: 4, 2, 3, 9 -- answer is [4 + 2 + 3], [9]

def array_sum_additive(array)
  sum = array.reduce(&:+)
  test_num = sum / 2 if sum
  if array.include?(test_num)
    array.delete(test_num)
    return [[test_num], array]
  end
  []
end
