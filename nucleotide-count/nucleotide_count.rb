class Nucleotide
  CODE = %w(A T C G)
  attr_accessor :dna

  def self.from_dna(str)
    @dna = []
    str.each_char do |char|
      @dna << char
    end
    @dna
    validate_dna
    new(@dna)
  end

  def count(char)
    @dna.count(char)
  end

  def initialize(dna)
    @dna = dna
  end

  def histogram
    h = {'A' => 0, 'T' => 0, 'C' => 0, 'G'=> 0 }
    @dna.each do |d| 
       h[d] += 1
    end
    h  
  end

  def self.validate_dna
    if @dna == ''
      @dna
    else
      @dna.each do |val|
        raise ArgumentError.new('Incorrect Nucleotide sequence detected') if !CODE.include?(val)
      end
    end
  end
end
