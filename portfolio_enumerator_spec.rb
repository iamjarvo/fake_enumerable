require 'minitest/spec'
require 'minitest/autorun'
require './fake_enumerator'
require './portfolio'

describe FakeEnumerator do
  before do
    @subject = Portfolio.new

    @subject << 1
    @subject << 2
    @subject << 3
    # @subject = FakeEnumerator.new(@subject, :map)
    @subject = @subject.map
  end

  it 'mixes in Enumerable' do
    FakeEnumerator.ancestors.must_include(FakeEnumerable)
  end

  describe '#next' do
    it 'returns the next element in the array' do
      @subject.next.must_equal 1
      @subject.next.must_equal 2
      @subject.next.must_equal 3
    end

    it 'raises a StopIterationError' do
      @subject.next.must_equal 1
      @subject.next.must_equal 2
      @subject.next.must_equal 3
      -> { @subject.next  }.must_raise StopIteration
    end
  end

  describe '#rewind' do
    it 'has the ability to rewind' do
      @subject.next
      @subject.next
      @subject.rewind

      @subject.next.must_equal 1
    end
  end
end
