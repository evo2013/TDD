class Sieve

  def initialize(limit)
    @limit = limit
  end

  def is_prime?(num)
    (2...num).each do |divisor|
      return false if num % divisor == 0
    end

    true
  end

  def primes(limit)
    primes = []

    (2...limit).each do |num|
    primes << num if is_prime?(num)
  end

  primes
end

