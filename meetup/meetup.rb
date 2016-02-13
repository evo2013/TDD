class Meetup
  TEENTH = [13, 14, 15, 16, 17, 18, 19]
  DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  CARDINALS = { first: 0, second: 1, third: 2, fourth: 3, last: -1 }

  def initialize(month, year)
    @month = month
    @year = year
    days_in_month = DAYS_IN_MONTH[@month]
    start_date = Date.new(@year, @month, 1)
    end_date = Date.new(@year, @month, days_in_month)
    @all_days = (start_date..end_date).to_a
  end

  def day(day, type_day)
    @weekday = day.id2name
    type_day == :teenth ? get_teenth(day, type_day) : get_cardinal(day, type_day)
  end

  def get_teenth(day, type_day)
    @type_day = type_day.to_s
    @result_arr = @all_days.select { |day| TEENTH.include?(day.strftime('%d').to_i) }
    @get_day = @result_arr.select { |result| result.strftime('%A').downcase == @weekday }
    exact_date = @get_day.pop.strftime('%d').to_i
    Date.new(@year, @month, exact_date)
  end

  def get_cardinal(day, type_day)
    @cardinal = CARDINALS[type_day]
    @result_arr = @all_days.select { |day| day.strftime('%A').downcase == @weekday }
    @get_day = @result_arr[@cardinal]
  end
end
