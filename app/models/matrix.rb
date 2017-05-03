class Matrix
  attr_reader :rows, :columns, :storage

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @storage = []

    build!
  end

  private

  def build!
    rows.times do |row|
      @storage[row] = build_row(row, columns * row)
    end
  end

  def build_row(row, numeric)
    [].tap do |row_data|
      columns.times do |column|
        numeric += 1

        row_data[column] = numeric
      end
    end
  end
end
