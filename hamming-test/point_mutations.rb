class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    @strand.empty? || @strand == strand2 ? 0 : calculate(strand2)
  end

  private

  def calculate(str2)
    @differences = 0
    @strand.chars.each_with_index do|ele, idx|
      str2.chars.each_with_index do|ele2, idx2|
        @differences += 1 if idx2 == idx && ele2 != ele
      end
    end
    @differences
  end
end
