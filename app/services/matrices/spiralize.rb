require_relative '../performable'

module Matrices
  class Spiralize
    include Performable

    # returns a sequence of numeric values from the matrix
    # in a spiral order (working from origin an 0,0 around to the center of the matrix)
    def perform(matrix)
      @matrix = matrix

      [].tap do |results|
        results.concat right(IndexPath[0,0], IndexPath[0, matrix.columns])
      end
    end

    private

    def right(origin, stop)
      y = origin.column

      [].tap do |results|
        while y < stop.column
          results << @matrix[IndexPath[origin.row, y]]

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
