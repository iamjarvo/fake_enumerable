require "./fake_enumerable"

class Portfolio
  include FakeEnumerable
  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def <<(account)
    @accounts << account
  end

  def each
    unless block_given?
      return FakeEnumerator.new(self, :each)
    end

    accounts.each do |account|
      yield(account)
    end
  end
end
