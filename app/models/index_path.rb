class IndexPath
  attr_accessor :row, :column

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
end
