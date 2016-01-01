class ETL
  def self.transform(many_input)
    @large_hsh = {}
    if many_input.length > 1
      many_input.each do |input|
        @large_hsh = @large_hsh.merge!(transform_many_values(input))
      end
      return @large_hsh
    else
      transform_many_values(many_input)
    end
  end

  def self.transform_many_values(input)
    @new_ary = []
    @new_hsh = {}
    if input.class == Array
      convert_to_hsh = {}
      convert_to_hsh[input[0]] = input[1]
      input = convert_to_hsh
    end

    single_key = input.keys.pop
    values_only = input.values.flatten
    values_only.each do |val|
      @new_hsh[single_key] = [val]
      @new_ary << @new_hsh
      @new_hsh = {}
    end

    @new_ary.each do |hsh|
      @new_hsh = @new_hsh.merge!(transform_one_value(hsh))
    end
    @new_hsh
  end

  def self.transform_one_value(item)
    transformer = item.to_a.flatten.reverse
    result = {}
    result[transformer[0].downcase!] = transformer[1]
    result
  end
end
