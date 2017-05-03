class IndexPath
  attr_reader :row, :column

  IndexOutOfBounds = Class.new(StandardError)

  # Class methods
  class << self

    # Convenient initializer
    # IndexPath[1,2]
    def [](row, column)
      new.tap do |path|
        path.row = row
        path.column = column
      end
    end
  end

  def row=(r)
    raise IndexOutOfBounds.new(r) if r < 0

    @row = r
  end

  def column=(c)
    raise IndexOutOfBounds.new(c) if c < 0

    @column = c
  end
end
