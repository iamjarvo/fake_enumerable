module FakeEnumerable
  def map
   return FakeEnumerator.new(self, :map) unless block_given?
    array = []

    each do |item|
      array << yield(item)
    end

    array
  end

  def select
    array = []

    each do |item|
      array << item if yield(item)
    end

    array
  end

  def reduce(arg=nil)
    if arg.is_a? Symbol
      return reduce { |accum, item| accum.send(arg, item) }
    end

    accumulator = arg

    each do |item|
      if accumulator
        accumulator = yield(accumulator, item)
      else
        accumulator = item
      end
    end

    accumulator
  end
end
