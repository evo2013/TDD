class PerfectNumber
  def self.classify(num)
    fail RuntimeError.new('Number cannot be negative!') if num < 0
    divisors = []
    (1...num).each do |ele|
      divisors << ele if num % ele == 0
    end
    num_type = divisors.reduce(:+)
    return 'perfect' if num_type == num
    num_type > num ? 'abundant' : 'deficient'
  end
end
