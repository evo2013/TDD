class Scrabble
  SCOREVALUES = {
    1 => %w(a e i l n o r s t u),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }

  def initialize(txt)
    @text = txt
  end

  def self.score(word)
    selfie = Scrabble.new(word)
    selfie.word_score
  end

  def score
    return 0 if @text.nil? || @text.empty? || @text.start_with?(" ")
    @text.length > 1 ? word_score : letter_score
  end

  def letter_score
    SCOREVALUES.map { |k, val| @text = k if val.include?(@text) }
    @text
  end

  def word_score
    @result = []
    @text.chars.each do |char|
      @text = char
      @result << letter_score
    end
    @result.reduce(:+)
  end
end
