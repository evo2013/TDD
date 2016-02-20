class PhoneNumber
  def initialize(telephone)
    @telephone = telephone
  end

  def number
    @clean_number = @telephone.gsub(/\D+/, '')
    @clean_number = '0000000000' if @clean_number.length < 10 || @clean_number.length == 11 && !@clean_number.start_with?("1") || @clean_number.length == 12
    @clean_number if @clean_number.length == 10 && @clean_number.start_with?("1")
    @clean_number.slice!(0) if @clean_number.length == 11 && @clean_number.start_with?("1")
    @telephone =~ /[a-z]/ ? '0000000000' : @clean_number
  end

  def area_code
    @telephone.slice(0..2)
  end

  def to_s
    @telephone.slice!(0) if @telephone.length == 11 && @telephone.start_with?("1")
    @telephone.insert(0, "(").insert(4, ")").insert(5, " ").insert(9, "-")
  end
end
