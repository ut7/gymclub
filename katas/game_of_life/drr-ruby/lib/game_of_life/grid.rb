# encoding: utf-8

module GameOfLife

  class Grid
    attr_reader :rows
    attr_accessor :generation

    def self.create(&block)
      GridCreator.new.create &block
    end

    def initialize(rows = nil, parent_generation = 0)
      @generation = parent_generation + 1
      @rows = rows || []
    end

    def child
      parent = self

      clone.tap do |ch|
        ch.each_cell do |cell|
          cell.send parent.outcome(cell)
        end
      end
    end

    def cell(row, column)
      rows[row][column]
    end

    def to_s
      [
        "Grid (generation #{generation})",
        '—' * (4 + (rows.size * 2) - 1),
        rows.map do |row|
          ["|", row.map {|cell| cell.alive? ? 'X' : '·'}, '|' ].flatten.join(' ')
        end.join("\n"),
        '—' * (4 + (rows.size * 2) - 1),
      ].flatten.join("\n")
    end

    def clone
      self.class.new(rows.map {|row| row.map {|cell| cell.clone } }, @generation)
    end

    def add_row(row_index, row)
      @rows << row.map.with_index do |cell, index|
        cell.tap do |c|
          c.row = row_index
          c.column = index
        end
      end
    end

    def ==(other)
      rows == other.rows
    end

    protected

    def each_cell
      rows.each do |row|
        row.each do |cell|
          yield cell
        end
      end
    end

    def outcome(cell)
      case neighbourhood_pressure(cell)
        when 0..1
          :die!
        when 2
          :stand_still!
        when 3
          :live!
        when 4..8
          :die!
      end
    end

    def neighbourhood_pressure(cell)
      neighbours(cell).reduce(0) {|sum, c| sum + c.life_points }
    end

    def neighbours(c)
      [
        relative_cell(c, -1, -1),   relative_cell(c, -1, 0) , relative_cell(c, -1, 1),
        relative_cell(c,  0, -1),   nil                     , relative_cell(c,  0, 1),
        relative_cell(c,  1, -1),   relative_cell(c,  1, 0) , relative_cell(c,  1, 1),
      ].compact
    end

    def relative_cell(cell, row_offset, column_offset)
      other_cell_row = cell.row + row_offset
      other_cell_column = cell.column + column_offset

      if (0...rows.size).include?(other_cell_row) && (0...rows[other_cell_row].size).include?(other_cell_column)
         cell(other_cell_row, other_cell_column)
      end
    end

  end
end
