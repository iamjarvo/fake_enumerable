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
end
