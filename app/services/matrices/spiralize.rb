require_relative '../performable'

module Matrices
  class Spiralize
    include Performable

    AlreadyExtracted = Class.new(StandardError)

    # returns a sequence of numeric values from the matrix
    # in a spiral order (working from origin an 0,0 around to the center of the matrix)
    def perform(matrix)
      @matrix = matrix
      @recorded_indices = []

      # Begin by navigating to the right from the origin
      # Each method (right, left, down, up) calls the next direction change
      # An exception is raised when we're finished (out of bounds or already attempted that cell)
      begin
        right!(IndexPath[0,0], IndexPath[0, max_columns])
      rescue AlreadyExtracted, Matrix::IndexPathOutOfBounds, IndexPath::IndexOutOfBounds => e
      end

      results
    end

    private

    def results
      @results ||= []
    end

    def add_result(r)
      results << r
    end

    # Pulls value from index and records that index as used
    def extract!(index)
      raise AlreadyExtracted if extracted?(index)

      @recorded_indices << index
      @matrix[index]
    end

    def extracted?(index)
      @recorded_indices.include?(index)
    end

    def max_rows
      @max_rows ||= @matrix.rows - 1
    end

    def max_columns
      @max_columns ||= @matrix.columns - 1
    end

    # Moves from origin until the indicated stop point
    #
    # Will begin moving down from the end of this row
    def right!(origin, stop)
      y = origin.column

      while y <= stop.column
        add_result extract!(IndexPath[origin.row, y])

        y += 1
      end

      # Begin moving down from the end of this row
      starts_at = IndexPath[stop.row + 1, stop.column]
      ends_at = IndexPath[max_rows - stop.row, stop.column]

      down!(starts_at, ends_at)
    end

    # Moves from origin until the indicated stop point
    #
    # Will begin moving up from beginning of this row
    def left!(origin, stop)
      y = origin.column

      while y >= stop.column
        add_result extract!(IndexPath[origin.row, y])

        y -= 1
      end

      # Begin moving up from the start of this row
      starts_at = IndexPath[stop.row - 1, stop.column]
      ends_at = IndexPath[max_rows - origin.row + 1, stop.column]

      up!(starts_at, ends_at)
    end

    # Moves from origin until the indicated stop point
    #
    # Will begin moving right from top of this column
    def up!(origin, stop)
      x = origin.row

      while x >= stop.row
        add_result extract!(IndexPath[x, origin.column])

        x -= 1
      end

      # Begin moving right from the start of this row
      starts_at = IndexPath[stop.row, stop.column + 1]
      ends_at = IndexPath[stop.row, max_columns - stop.column - 1]

      right!(starts_at, ends_at)
    end

    # Moves from origin until the indicated stop point
    #
    # Will begin moving left from bottom of this column
    def down!(origin, stop)
      x = origin.row

      while x <= stop.row
        add_result extract!(IndexPath[x, origin.column])

        x += 1
      end

      # Begin moving left from the end of this row
      starts_at = IndexPath[stop.row, stop.column - 1]
      ends_at = IndexPath[stop.row, max_columns - stop.column]

      left!(starts_at, ends_at)
    end
  end
end
