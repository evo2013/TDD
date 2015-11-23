require 'pry'

class Complement
 # def initialize
   # @dna= {'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U'}
   # @rna= {'C' => 'G', 'G' => 'C', 'A' => 'T', 'U' => 'A'}
  # end

  def self.of_dna(str)
    @dna= {'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U'}
    dkeys = @dna.keys
    raise ArgumentError.new('Incorrect DNA Transcription input') if !dkeys.include?(str)
 
    transcription  = ''		
    str.each_char do |s|
      transcription << @dna[s]
    end
    transcription
  end

  def self.of_rna(str)
     @dna= {'C' => 'G', 'G' => 'C', 'A' => 'T', 'U' => 'A'}
    rna_transcription  = ''         
    str.each_char do |s|
      rna_transcription << @dna[s]
    end
    rna_transcription
  end

end

