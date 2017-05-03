class Matrix
  attr_reader :rows, :columns, :storage

  def initialize(rows, columns)
    @rows = rows
    @columns = columns

    build!
  end

  private

  def build!
    @storage = []

    rows.times do |row|
      row_data = []

      columns.times do |column|
        row_data[column] = 1
      end

      @storage[row] = row_data
    end
  end
end
