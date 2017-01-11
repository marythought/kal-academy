# 1. Implement an algorithm to determine if a string has all unique characters.
# What if you cannot use additional data structures?

def unique?(string)
  # could sort in place then check equality. b is greater than a. every char to the right should be greater than to the left.
  # or could build a hash then check values, no value should be greater than 1

end

#
# 2. Given two strings, write a method to decide if one is a permutation of the other?
# 
# 3. Write a method to replace all spaces in a string with ‘%20’.
#
# 4. Implement a method to perform a basic string compression using the counts of repeated characters. For example, the string aabccccaaa would become a2b1c4a3. If the compressed string would not become smaller than the original string, your method should return the original string.
#
# 5. Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
#
# 6. Given two sequences, print longest common subsequence
#
# LCS for input Sequences “ABCDGH” and “AEDFHR” is “ADH” of length 3. LCS for input Sequences “AGGTAB” and “GXTXAYB” is “GTAB” of length 4.
#
# 7. Given two string str1 and str2, find the shortest string that has both str1 and str2 as subsequences.
#
# Examples:
#
# Input: str1 = “geek”, str2=”eke”
#
# Output: “geeke”
#
# Input: str1 = “AGGTAB”, str2=”GXTXAYB”
#
# Output: “AGXGTXAYB”
#
# 8. Remove spaces from a given string in O(n) running time and only one traversal of a string.
#
# Input: “I love ice cream”
#
# Output: “Iloveicecream”
#
# 9. Find all distinct palindromic sub-strings of a given string
#
# Input: str = "abaaa"
#
# Output: Below are 5 palindrome sub-strings
#
# a
#
# aa
#
# aaa
#
# aba
#
# b
#
# 10. Given a string "This is a string" reverse its characters "gnirts a si siht"
#
# 11. Given a string "This is a string" reverse the characters in every word "siht si a gnirts"
