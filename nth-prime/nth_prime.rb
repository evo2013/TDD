class Prime
  def self.nth(num)		
  	raise ArgumentError.new(ERROR_MESSAGE) if num == 0
  	test = (1..64).to_a 
   	prime_list = test.delete_if { |num| num > 2 && num.even? || num == 1 }
   									 .delete_if { |num| num > 3 && num % 3 == 0 }
   									 .delete_if { |num| num > 5 && num % 5 == 0 }
   									 .delete_if { |num| num > 7 && num % 7 == 0 }
    prime_list[num - 1]
  end
end
