require_relative '../performable'

module Matrices
  class Spiralize
    include Performable

    # returns a space separate sequence of numeric values from the matrix
    # in a spiral order (working from origin an 0,0 around to the center of the matrix)
    def perform(matrix)
      matrix.storage.flatten
    end

    private

    def right(origin, stop)
    end

    def left(origin, stop)
    end

    def up(origin, stop)
    end

    def down(origin, stop)
    end
  end
end
