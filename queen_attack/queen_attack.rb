class Queens

  def initialize(coordinates = {})
    @white = coordinates.fetch(:white, [0, 3] )
    @black = coordinates.fetch(:black, [7, 3] )
    raise ArgumentError.new('Both queens cannot occupy the same space') if @white == @black
  end

  def white
    @white
  end

  def black
    @black
  end

  def to_s
  matrix = Array.new(8) { Array.new(8) }

    (0..7).each do |row|
      (0..7).each do |col|
         matrix[row][col] = "_"
        if [row, col] == white
          matrix[row][col] = "W"
        elsif [row, col] == black
          matrix[row][col] = "B"
        end
      end
    end

    matrix.map { |row| row.join(' ') }.join("\n")
  end

  def attack?
    if white[0] == black[0]
      return true
    elsif white[1] == black[1]
      return true
    elsif (white[0] - black[0]).abs == (white[1] - black[1]).abs
      return true
    else
      return false
    end
  end
end

