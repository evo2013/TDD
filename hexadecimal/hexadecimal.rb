class Hexadecimal
  def initialize(hex_values)
    hex_numbers = []
    @hex_values = hex_values.chars
    @hex_values.each do |hex|
      if hex.to_i.to_s == hex
        hex_numbers << hex.to_i
      elsif hex == "a"
        hex_numbers << 10
      elsif hex == "b"
        hex_numbers << 11
      elsif hex == "c"
        hex_numbers << 12
      elsif hex == "d"
        hex_numbers << 13
      elsif hex == "e"
        hex_numbers << 14
      elsif hex == "f"
        hex_numbers << 15
      else
        hex_numbers = 0
        break
      end
    end

    if hex_numbers != 0
      @hex_numbers = hex_numbers.reverse
    else
      @hex_numbers = [0]
    end
  end

  def to_decimal
    result = []
    @power = -1
    @hex_numbers.each do |num|
      convert_decimal = num * (16**(@power + 1))
      result << convert_decimal
      @power += 1
    end
    @result = result.inject { |sum, n| sum + n }
  end
end
