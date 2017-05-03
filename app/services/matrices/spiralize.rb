require_relative '../performable'

module Matrices
  class Spiralize
    include Performable

    # returns a sequence of numeric values from the matrix
    # in a spiral order (working from origin an 0,0 around to the center of the matrix)
    def perform(matrix)
      @matrix = matrix
      @recorded_indices = []

      [].tap do |results|
        results.concat right(IndexPath[0,0], IndexPath[0, matrix.columns])
      end
    end

    private

    # Pulls value from index and records that index as used
    def extract!(index)
      @recorded_indices << index

      @matrix[index]
    end

    def extracted?(index)
      @recorded_indices.include?(index)
    end

    def right(origin, stop)
      y = origin.column

      [].tap do |results|
        while y < stop.column
          results << extract!(IndexPath[origin.row, y])

          y += 1
        end
      end
    end

    def left(origin, stop)
    end

    def up(origin, stop)
    end

    def down(origin, stop)
    end
  end
end
