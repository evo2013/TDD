class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(num)
    return 0 if num == 1
    (1...num).select { |digit| digit % 3 == 0 || digit % 5 == 0 }.reduce(&:+)
  end

  def to(limit)
    sum = @numbers.each_with_object([]) do |ele, arr|
      arr << (1...limit).select { |int| int % ele == 0 }
    end
    sum.flatten.uniq.reduce(&:+)
  end
end
