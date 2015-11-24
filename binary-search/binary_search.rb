class BinarySearch
  def initialize(ary)
    @ary = ary
    validate(@ary)
  end

  def list
    @ary
  end

  def validate(ary)
    raise ArgumentError.new('Invalid input. Numbers must be sorted!') if ary != ary.sort
  end

  def search_for(number)
    raise RuntimeError.new('Invalid request. No such number in data input') if !@ary.include?(number)
    @ary.index(number) 
  end
 
  def middle
    mid = @ary.length/2
  end
end
