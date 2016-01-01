class PigLatin
  @consonants = %w(b c d f g h j k l m n p qu q r s t v w x y z)
  @vowels = %w(a e i o u xr yt)

  def self.translate(phrase)
    phrase.split(' ').map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    @result = ""
    @vowels.each do |v_sound|
      if word.start_with?(v_sound)
        @result = word + "ay"
        return @result if @result.length > 0
      end
    end
    remove_consonant(word)

    if @result.length > 0 && word.start_with?("a", "e", "i", "o", "u")
      return @result + "ay"
    else
      until @result.start_with?("a", "e", "i", "o", "u")
        remove_consonant(@result)
      end
      return @result + "ay"
    end
  end

  def self.remove_consonant(word)
    @consonants.each do |c_sound|
      if word.start_with?(c_sound)
        c_sound = word.slice!(c_sound)
        word << c_sound
        @result = word
      end
    end
    @result
  end
end
