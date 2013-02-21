# encoding: utf-8

module GameOfLife

  class FancyBlockGridCreator
    attr_reader :grid

    def initialize
      @current_row = []
      @row_index = -1
    end

    def create(&block)
      @grid = Grid.new
      instance_eval &block
      grid
    end

    private

    def add_row!
      @row_index += 1
      @grid.add_row(@row_index, @current_row)
      @current_row = []
    end

    def ¦(*_)
      if has_started_building_a_row?
        add_row!
        stop_building_a_row!
      else
        start_building_a_row!
      end
    end

    def start_building_a_row!
      @building_a_row = true
    end

    def stop_building_a_row!
      @building_a_row = false
    end

    def has_started_building_a_row?
      !!@building_a_row
    end

    def ·(*_)
      # GOTCHA! expressions within the block will be returned right to left.
      # So we need to unshift new cells into the row, not append them!
      @current_row.unshift Cell.new(false)
    end

    def X(*_)
      # GOTCHA! expressions within the block will be returned right to left.
      # So we need to unshift new cells into the row, not append them!
      @current_row.unshift Cell.new(true)
    end

    def method_missing(method, *args)
      super unless method.to_s =~ /—+/
    end

    def respond_to_missing(method)
      method.to_s =~ /—+/
    end

  end # GridCreator

end
