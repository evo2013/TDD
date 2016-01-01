class PhoneNumber
  attr_accessor :telephone, :code
  LETTERS = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  def initialize(telephone)
    @telephone = telephone
  end

  def number
    if telephone == telephone.to_i.to_s
      return '0000000000' if telephone.length < 10
      return telephone if telephone.length == 10 && telephone[0] == "1"
      return telephone[1..10] if telephone.length == 11 && telephone.start_with?("1")
      return '0000000000' if telephone.length == 11
      return '0000000000' if telephone.length == 12 && telephone.start_with?("1")
    else
      processing = telephone.split(//)
      arr = []
      processing.each do |char|
        return '0000000000' if LETTERS.include?(char)
        arr << char.to_i if char == char.to_i.to_s
      end
    end
    arr = arr.join
  end

  def area_code
    @code = telephone[0..2]
  end

  def to_s
    @telephone = telephone[1..10] if telephone.length == 11 && telephone.start_with?("1")
    @telephone = telephone.prepend("(")
    @telephone = telephone.insert(4, ")").insert(5, " ").insert(9, "-")
  end
end
