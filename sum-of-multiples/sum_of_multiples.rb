class SumOfMultiples
  def initialize(*args)
    @args = args
    @multiples = []
  end

  def self.to(input)
    @multiples = (0...input).select { |num| num % 3 == 0 || num % 5 == 0 }
    @multiples.reduce(:+)
  end

  def to(input)
    @args.each do |arg|
      @multiples << (0...input).select { |num| num % arg == 0 }
    end
    @multiples.flatten!.uniq!.reduce(:+)
  end
end
