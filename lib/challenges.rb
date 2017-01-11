# 33. Given any integer, print an English phrase that describes the integer (e.g., “One Thousand, Two Hundred Thirty Four”)
#

UNIQUE_NUMBERS = {
  0 => "",
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "fourty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
}

def int_to_phrase(integer)
  return "zero" if integer == 0
  numbers = integer.to_s.chars
  phrase = ""
  length = numbers.length
  prefix_index = {
    1 => ["", 0],
    2 => ["", 1],
    3 => ["hundred", 0],
    4 => ["thousand", 0],
    5 => ["thousand", 1],
    6 => ["hundred", 0],
    7 => ["million", 0]
  }

  until numbers.length == 0
    string, index = prefix_index[length] #["thousand", 1]
    if index == 0
      phrase += UNIQUE_NUMBERS[numbers[index].to_i] + " " + string unless numbers[0] == "0"
    else
      first_num, second_num = numbers[0..1]
      if UNIQUE_NUMBERS[[first_num, second_num].join.to_i]
        phrase += UNIQUE_NUMBERS[[first_num, second_num].join.to_i] + " " + string
      else
        first_num += "0"
        phrase += UNIQUE_NUMBERS[first_num.to_i] + " "
        phrase += UNIQUE_NUMBERS[second_num.to_i] + " " + string
      end unless first_num == "0" && second_num == "0"
    end
    numbers = numbers[(index.to_i + 1)..-1]
    length = numbers.length
    if length >= 3 && length % 3 == 0 && numbers[0] != "0"
      phrase += ", "
    else
      phrase += " "
    end
  end
  phrase.strip
end

# 34. How to determine if a number is a power of 2.
def power_of_two?(int)
  temp = 1
  until temp > int
    new = 2 * temp
    return true if new == int
    temp = new
  end
  false
end


# 35. Find a specific row and a column value in a Pascal’s triangle
