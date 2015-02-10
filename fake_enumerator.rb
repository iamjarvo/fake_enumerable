require './fake_enumerable'
require 'fiber' # access to alive?

class FakeEnumerator
  include FakeEnumerable

  attr_reader :target

  def initialize(target, iterator)
    @target = target
    @iterator = iterator
  end

  def each(&block)
    target.send(@iterator, &block)
  end

  def next
    @fiber ||= Fiber.new do
      each do |item|
        Fiber.yield(item)
      end
      raise StopIteration
    end

    @fiber.resume
  end

  def rewind
    @fiber = nil
  end
end
