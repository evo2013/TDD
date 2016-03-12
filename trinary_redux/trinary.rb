class Trinary
  def to_decimal
    input.match(/[a-z]/) ? input.gsub!(/[a-z0-9]/, '0') : input.each_char.map(&:to_i)
    conversion = input.reverse.each_with_index.collect { |num, idx| num * 3**idx }.reduce(&:+)
  end
end
