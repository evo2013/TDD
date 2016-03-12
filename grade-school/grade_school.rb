class School
  attr_accessor :students
  VERSION = 1

  def initialize(students={})
   @students = students
  end

  def to_h
    Hash[@students.sort]
  end

  def add(arg1, arg2)
    arg1 = [arg1]
    args = Hash[arg2, arg1]
    @students.merge!(args) { |_, val1, val2| [val1, val2].flatten.sort }
  end

  def grade(num)
    if !@students.keys.include?(num)
      @students = []
    else
      @students = @students.select! { |key, _| num == key }
      @students.values.flatten.sort
    end
  end
end
