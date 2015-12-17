class Octal
  attr_accessor :result, :input
  BASE = 8

  def initialize(input)  
   @input = input
   exit if validate?(input) == 0
   @input = input.reverse.chars  
  end

  def validate?(input)
   return 0 if @input.to_i.to_s != @input || @input.include?("8") || @input.include?("9")  
  end

  def to_decimal
    @result = []
    @input.each_with_index do |chr, index|
      computation = chr.to_i * BASE**index  
      result << computation
    end
    result.reduce(:+)
  end
end
