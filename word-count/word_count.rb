class Phrase
  Phrase::VERSION = 1

  def initialize(input)
    @str = []
    multi_str = input.split(/[\s,]+/)
    multi_str.each do |i|
      compressed = i.gsub(/\W+(?<!')/, '')
      compressed.delete!("'") if compressed.chr == "'"
      @str << compressed.downcase if compressed != ""
    end
  end

  def word_count
    result = {}
    @str.each do |word|
      if result.key?(word)
        result[word] += 1
      else
        result[word] = 1
      end
    end
    result
  end
end
