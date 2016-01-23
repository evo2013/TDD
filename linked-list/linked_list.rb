class Deque
  attr_accessor :container

  def initialize
    @container = []
  end

  def push(input)
    container << input
  end

  def pop
    container.pop
  end

  def shift
    container.shift
  end

  def unshift(num)
    container.unshift(num)
  end
end
