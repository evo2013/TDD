class Anagram
  def initialize(word)
    @word = word
  end

  def match(args)
    @result = []
    args.each do |argument|
      next if argument.downcase == @word.downcase
      @result << argument if argument.downcase.chars.sort.join == @word.downcase.chars.sort.join
    end
    @result
  end

  def sort
    @result = @result.sort
  end
end
