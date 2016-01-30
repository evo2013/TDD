class School
  attr_accessor :students

  def initialize
    @students = {}
  end

  def to_h
    students.each do |_, val|
      val.sort!
    end
    Hash[students.sort]
  end

  def add(name, grade)
    students[grade] << name if students[grade]
    students[grade] = [] << name if !students[grade]
  end

  def grade(level)
    students.keys.include?(level) ? students[level] : []
  end
end
