class Year
  VERSION = 1

  def self.leap?(input)
    if input % 100.0 == 0.0 && input % 400.0 != 0.0
      'No ' + input.to_s + ' is not a leap year'
    elsif input % 4.0 == 0
      'Yes, ' + input.to_s + ' is a leap year'
    end
  end
end
