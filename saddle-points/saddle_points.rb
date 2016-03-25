class Matrix
  attr_accessor :rows, :columns

  def initialize(input)
    @rows = pull_rows(input)
    @columns = pull_columns(rows)
  end

  def pull_rows(data)
    separated = data.split("\n")
    separated.each.map { |segment| segment.split(" ").map(&:to_i) }
  end

  def pull_columns(row_data)
    row_data.transpose
  end

  def saddle_points
    list = []
    rows.each_with_index do |row, idx|
      biggest_num = row.max
      columns.each_with_index do |col, c_idx|
        @col_idx = c_idx if col.include?(biggest_num) && biggest_num <= col.min
      end
      list = [] if @col_idx.nil?
      list << [idx, @col_idx] if !@col_idx.nil && biggest_num <= columns[@col_idx].min
    end
    list
  end
end
