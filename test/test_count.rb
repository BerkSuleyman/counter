require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/count'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

describe 'count' do

    it 'takes take start and stop as arguments'  do
      proc { count() }.must_raise ArgumentError
      proc { count(to:5) }.must_raise ArgumentError
    end

    it 'returns a correct, comma-separated list if from: is smaller than to:' do
      count(from:3, to:5).must_equal '3,4,5'
      count(from:85, to:88).must_equal '85,86,87,88'
    end

    it 'returns from: (or to:) if from and to are equal' do
      count(from:1, to:1).must_equal '1'
      count(from:42, to:42).must_equal '42'
    end

    ## Avkommentera det här testet för bonusbanan
    #it 'counts down if to: is less than from:' do
    #  count(from:2, to:-5).must_equal '2,1,0,-1,-2,-3,-4,-5'
    #  count(from:-3, to:-5).must_equal '-3,-4,-5'
    #end

end