class CircularBuffer
  BufferEmptyException = "Error! Buffer is empty."
  BufferFullException = "Stop! Buffer is full."

  def initialize(len)
    @buffer = []
    @len = len
  end

  def read
    fail BufferEmptyException if @buffer == []
    @buffer.shift
  end

  def write(input)
    input.nil? ? @buffer : @buffer << input
    fail BufferFullException if @buffer.length > @len
  end

  def clear
    @buffer = []
  end

  def write!(input_forced)
    if @buffer.length == @len && input_forced.nil?
      @buffer
    elsif @buffer.length == @len
      @buffer.shift
      @buffer << input_forced
    elsif @buffer.length < @len
      @buffer << input_forced
    end
  end
end
