module FakeEnumerable
  def map
    array = []

    each do |item|
      array << yield(item)
    end

    array
  end
end
