module FakeEnumerable
  def map
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

  def reduce(accumulator=nil)
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
