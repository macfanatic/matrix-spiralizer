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

    numeric = 1

    # For each row
    rows.times do |row|
      row_data = []

      # Build the row data
      columns.times do |column|
        row_data[column] = numeric

        numeric += 1
      end

      @storage[row] = row_data
    end
  end
end
