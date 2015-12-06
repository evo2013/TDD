class Phrase
  Phrase::VERSION = 1
  def initialize(str)
    @str = []
    multi_str = str.split(/[\s,]+/)
    multi_str.each do |str|
      compressed = str.gsub(/\W+(?<!')/, '')
      compressed.delete!("'") if compressed.chr == "'"
      @str << compressed.downcase if compressed != ""
    end
  end

  def word_count
   result = {}
   @str.each do |word|
     if result.has_key?(word)
        result[word] += 1
     else
       result[word] = 1
     end  
    end
    result
  end
end
