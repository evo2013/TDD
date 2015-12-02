class TriangleError < ArgumentError
end

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise TriangleError.new('Error! Triangle sides must be greater than zero.') if @side1 ==0 || @side2 == 0 || @side3 ==0
    raise TriangleError.new('Error! Triangle sides cannot be negative number.') if @side1 < 0 || @side2 < 0 || @side3 < 0
    if (@side1 + @side2) <= @side3 || (@side2 + @side3) <= @side1 || (@side1 + @side3) <= @side2 
      raise TriangleError.new('Error! Triangle sides violate triangle inequality rule.')
    end 
  end

  def kind
    if @side1 == @side2 && @side2 == @side3 && @side1 == @side3
      :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      :isosceles    
    elsif @side1 != @side2 && @side2 != @side3 && @side1 != @side3
      :scalene 
   end
  end
end
