require 'pry'
class Crypto
  SQUARES = [4, 9, 16, 25, 36, 49, 64, 81, 100]
  attr_accessor :segment

  def initialize(str)
    @str = str
  end

  def normalize_plaintext
    @str.gsub(/\W/ , '').downcase
  end

  def size
    normal = self.normalize_plaintext
    if SQUARES.include?(normal.length)
      Math.sqrt(@str.length).to_i 
    else
      bigger = SQUARES.select {|sqr| sqr > normal.length }.shift
      Math.sqrt(bigger).to_i
    end
  end

  def plaintext_segments
    @segment = self.size.to_i
    plaintext = self.normalize_plaintext
    parse(plaintext, segment)
  end

  def ciphertext
    plaintext_arr = self.plaintext_segments 
    @long_str = ''
    counter = 0 

    loop do 
      plaintext_arr.select { |plaintext| @long_str << plaintext[counter] if plaintext[counter]} 
      counter = counter + 1
      return @long_str if counter == segment
    end 
  end

  private

  def parse(string, size)
    string.scan(/.{1,#{size}}/)
  end
end
