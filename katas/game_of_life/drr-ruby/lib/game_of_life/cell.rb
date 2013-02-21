# encoding: utf-8

module GameOfLife
  class Cell

    attr_accessor :row, :column

    def initialize(alive, row = nil, column = nil)
      @alive = alive
      @row = row
      @column = column
    end

    def alive?
      !!@alive
    end

    def life_points
      @alive ? 1 : 0
    end

    def live!
      @alive = true
    end

    def die!
      @alive = false
    end

    def stand_still!
    end

    def initialize_copy(source)
      super
      self.class.new(@alive, @row, @column)
    end

    def ==(other)
      row == other.row && column == other.column && @alive == other.alive?
    end

  end
end
