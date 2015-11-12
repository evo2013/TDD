class Series

  def initialize(str)
    new_array = turn_into_array(str)
    @new_array = new_array
  end

  def slices(number)
    raise ArgumentError.new('Slice size of output cannot exceed length of input') if number > @new_array.size

    if number == 1
      @new_array.each_slice(number).to_a
    else
      @new_array.each_cons(number).to_a
    end
  end

  def turn_into_array(str)
    str.split(//).map {|char|  char.to_i} # => [0, 1, 2, 3, 4] 
  end
  
end
