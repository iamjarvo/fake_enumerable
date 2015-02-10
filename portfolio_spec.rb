require 'minitest/spec'
require 'minitest/autorun'
require './portfolio'

describe Portfolio do
  before do
    @subject = Portfolio.new

    @subject << 1
    @subject << 2
    @subject << 3
  end

  describe '#map' do

    it 'does not modify the current array' do
      @subject.map { |num| num + 1 }

      @subject.accounts.must_equal [1, 2, 3]
    end

    it 'returns an array with values' do
      result = @subject.map { |num| num + 1 }   

      result.must_equal [2, 3, 4]
    end
  end

  describe '#select' do
    it 'returns an array with values where condition is true' do
      result = @subject.select { |num| num.even? }

      result.must_equal [2]
    end
  end
end
