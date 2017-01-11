require "spec_helper"
require "challenges.rb"

describe 'question 1' do
  it 'prints an english phrase of a given integer' do
    assert_equal 'one thousand, six hundred thirteen', int_to_phrase(1613), 'works for 4 digits'
    assert_equal 'nine hundred ninety nine thousand, nine hundred ninety nine', int_to_phrase(999_999)
    assert_equal 'one million', int_to_phrase(1_000_000)
    assert_equal 'ten thousand', int_to_phrase(10_000)
    assert_equal 'one thousand', int_to_phrase(1_000)
    assert_equal 'one hundred', int_to_phrase(100), 'works for multiple of 100'
    assert_equal 'three', int_to_phrase(3)
    assert_equal 'fifteen', int_to_phrase(15)
    assert_equal 'zero', int_to_phrase(0)

  end
end
