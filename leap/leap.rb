class Year
	VERSION = 1

  def self.leap?(input)
  	 input % 400 ==  0 || input % 4 == 0 && input % 100 != 0
  end
end
