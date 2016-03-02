class Clock
  attr_accessor :clocktime

  def self.at(hour, min=0)
    new(hour, min)
  end

  def initialize(hour, min)
    @clocktime = Time.utc(1970, 1, 1, hour, min)
  end

  def +(min)
    @clocktime += (min * 60)
    read_time
  end

  def -(min)
    @clocktime -= (min * 60)
    read_time
  end

  def read_time
    @add_subtract_time = true
    @clocktime.strftime('%R')
  end

  def ==(other)
    clocktime == other.clocktime
  end

  def to_s
    @add_subtract_time == true ? read_time : @clocktime.strftime('%R')
  end
end
