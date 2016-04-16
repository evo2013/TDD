class WordProblem
  def initialize(str)
    @str = str.gsub(/[?]/, "").split(" ")
    @operands = @str.select { |op| op == "plus" || op == "minus" || op == "multiplied" || op == "divided" }
    fail ArgumentError.new("Unrecognized operation.") if @operands.count == 0
  end

  def answer
    holder = []
    @str.each do |word|
      holder << word if word.to_i.to_s == word
    end
    @operands.count == 1 ? calc(holder, @str) : calc_multi(holder, @operands)
  end

  private

  def calc(nums_ary, operators)
    args = nums_ary.flatten.each.map(&:to_i)
    return args.reduce(&:+) if operators.send(:include?, "plus")
    return args[0] - args[1] if operators.send(:include?, "minus")
    return args[0] * args[1] if operators.send(:include?, "multiplied")
    return args[0] / args[1] if operators.send(:include?, "divided")
  end

  def calc_multi(nums, new_operators)
    intermediate = calc(nums[0..1], new_operators[0])
    calc([intermediate.to_s, nums[2]], new_operators[1])
  end
end
