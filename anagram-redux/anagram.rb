class Anagram
  def initialize(word)
    @same_word = word
    @word = word.downcase.chars.sort.join
  end

  def match(multi)
    sorted =  multi.map { |ele| ele.downcase.chars.sort.join }
    @result = []
    sorted.each_with_index do |one_word, idx|
      @result << multi[idx] if one_word == @word
    end
    @result.delete_if { |match_word| match_word.downcase == @same_word.downcase }
  end

  def sort
    @result.sort
  end
end
