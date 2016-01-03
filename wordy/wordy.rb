class WordProblem
  OPERATE = { "plus" => :+, "minus" => :-, "multiplied" => :*, "divided" => :/ }

  def initialize(str)
    @str = str.delete!("?").split(' ')
    answer
  end

  def answer
    @compute = @str.select { |word| word.to_i.to_s == word }
    @compute.map!(&:to_i)
    perform_operation
  end

  def perform_operation
    @total_operations = @str.select { |one_word| OPERATE.keys.include?(one_word) }
    if @total_operations.empty?
      fail ArgumentError.new("Input too complicated or not a mathematical calculation")
    end
    if @total_operations.count > 1
      multiple_operations
    else
      case @total_operations
      when ["plus"]
        @compute.reduce(OPERATE["plus"])
      when ["minus"]
        @compute.reduce(OPERATE["minus"])
      when ["multiplied"]
        @compute.reduce(OPERATE["multiplied"])
      when ["divided"]
        @compute.reduce(OPERATE["divided"])
      end
    end
  end

  def multiple_operations
    operation1 = [@compute[0], @compute[1]].reduce(OPERATE[@total_operations[0]])
    [operation1, @compute[2]].reduce(OPERATE[@total_operations[1]])
  end
end
