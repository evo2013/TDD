class Luhn
  def initialize(numbers)
    @numbers = numbers.to_s.chars.map { |num| num.to_i }
  end

  def addends
    total_digits = @numbers.length 
    hold_index = (1..total_digits).select { |position| position.even? } 
    negative_positions = []
    hold_index.each do |num| 
      negative_positions  << -num
    end
    hash_new(negative_positions)
  end

  def checksum
    joiner = addends.join.to_i
    check_sum = joiner.to_s.chars.map { |str| str.to_i }.reduce(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(input)
    input_zero = input.to_s + '0'
    create_number =  self.new(input_zero)
    checksum_number = create_number.checksum

    # Based on checksum, get last digit to make original input number valid
    number_choices = (0..9)
    last_digit = number_choices.select { |num| ((checksum_number + num) % 10) == 0 }
    pop_number = last_digit.pop
    input_number = input.to_s 
    valid_number = input_number + "#{pop_number}" 
    valid_number.to_i   
  end
  
  private

  def hash_new(negative_positions)
    hsh_new_values = {}
    negative_positions.each do |idx|
      doubler = @numbers[idx] * 2
      doubler = doubler - 9 if doubler > 10   
      hsh_new_values[idx] = doubler  
    end
    get_add_ends(hsh_new_values)  
  end

  def get_add_ends(hsh_new_values)
    hsh_new_values.each do |k, val| 
      @numbers[k] = val
    end  
    add_ends = @numbers  
  end
end
