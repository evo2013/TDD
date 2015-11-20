class School
  attr_accessor :students
  VERSION = 1

  def initialize( students={})
    @students = students
  end

  def to_h
    @students
    Hash[@students.sort]
  end

  def add(arg1,arg2)
    arg1 = [arg1]
    args = Hash[arg2, arg1]
    @students.merge!(args){|key, val1, val2| [val1, val2].flatten.sort }
    p @students
  end

  def grade(num)
    if !@students.keys.include?(num)
      @students = []
    else
      @students = @students.select! { |key, val| num == key }
      @students.values.flatten.sort
    end
  end
end
