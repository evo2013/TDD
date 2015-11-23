require 'pry'

class Complement
   DNA = {'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U'}
   RNA = {'C' => 'G', 'G' => 'C', 'A' => 'T', 'U' => 'A'}
   VERSION = 2


  def self.of_dna(str)
    self.dna_validate(str)
    transcription  = ''   
    str.each_char do |s|
      transcription << DNA[s]
    end
    transcription
  end

  def self.of_rna(str)
    self.rna_validate(str)
    rna_transcription  = ''         
    str.each_char do |s|
      rna_transcription << RNA[s]
    end
    rna_transcription
  end

  def self.dna_validate(str)
    dkeys = DNA.keys
    str.each_char do |s|
      raise ArgumentError.new('Invalid DNA Transcription input') if !dkeys.include?(s)
    end
  end

  def self.rna_validate(str)
    rkeys = RNA.keys
    str.each_char do |s|
      raise ArgumentError.new('Invalid RNA Transcription input') if !rkeys.include?(s)
    end
  end
end

