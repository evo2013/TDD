class Trinary
  def initialize(number)
    if number.length == 1
      @number = number.to_i
    else
      @number = number.to_s.chars.map(&:to_i) #[1, 2, 3]
    end
  end

  def to_decimal
    result = []
    if @number.class == Fixnum
      @counter = [@number].count - 1
    elsif @number.class == Array
      @counter = @number.length - 1
    end
    if @counter == 0
      result = @number * 3 ** @counter 
    else
      @number.each do |num|
        result << (num * 3 ** @counter)
        @counter -= 1
      end
      result.reduce(:+)
    end
  end
end
