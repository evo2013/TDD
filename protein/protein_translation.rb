class InvalidCodonError < StandardError
end

class Translation
  PROTEINS = { ["AUG"] => "Methionine", ["UUU", "UUC"] => "Phenylalanine", ["UUA", "UUG"] => "Leucine", ["UCU", "UCC", "UCA", "UCG"] => "Serine", ["UAU", "UAC"] => "Tyrosine", ["UGU", "UGC"] => "Cysteine", ["UGG"] => "Tryptophan", ["UAA", "UAG", "UGA"] => "STOP" }

  def self.of_codon(codon)
    @codon = codon
    select_key = PROTEINS.keys.select { |item| item.include?(@codon) }.flatten
    PROTEINS[select_key]
  end

  def self.of_rna(code)
    @code = code.chars.each_slice(3).map(&:join)
    validate
    result = []
    @code.each do |c|
      break if ["UAA", "UAG", "UGA"].include?(c)
      result << of_codon(c)
    end
    result
  end

  def self.validate
    @code.each do |c|
      fail InvalidCodonError, "Error. Invalid codon input" if !PROTEINS.keys.flatten.include?(c)
    end
  end
end
