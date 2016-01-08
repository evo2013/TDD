class Binary
  BASE = 2
  VERSION = 1
  VALID_NUMBERS = ["0", "1"]

  def initialize(input)
    input.chars.each do |char|
      fail ArgumentError.new("Invalid binary number") if !VALID_NUMBERS.include?(char)
    end
    @input = input.split('').map(&:to_i)
  end

  def to_decimal
    @input == [0] ? 0 : convert
  end

  def convert
    @input.reverse!
    result = []
    @input.each_with_index do |num, idx|
      result << num * BASE**idx
    end
    result.reduce(:+)
  end
end
