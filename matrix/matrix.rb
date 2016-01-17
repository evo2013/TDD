class Matrix
  def initialize(rows_columns)
    rc = rows_columns.split("\n")
    @rows_columns = []
    rc.each do |item|
      @rows_columns << item.split(" ").map(&:to_i)
    end
  end

  def rows
    @rows_columns
  end

  def columns
    counter = 0
    single_column = []
    all_columns = []
    while counter < @rows_columns[0].length
      @rows_columns.each do |list|
        single_column << list[counter]
      end
      all_columns << single_column
      counter += 1
      single_column = []
    end

    all_columns
  end
end
