require 'pry'
require 'pry-nav'


class Puzzle
  def self.solve_part_one(passes)
    seat_ids = passes.map do |pass|
      seat = Puzzle.find_seat(pass)
      Puzzle.find_seat_id(seat)
    end.sort.last
  end

  def self.find_seat(coded)
    coded = coded.split("")
    row = find_spot(coded.first(7), (0..127), "B", "F")
    column = find_spot(coded.last(3), (0..7), "R", "L")
    return [row, column]
  end

  def self.find_seat_id(seat)
    seat[0] * 8 + seat[1]
  end

  def self.find_spot(coded, range, upper_var, lower_var)
    coded.each_with_index do |c, i|
      upper = range.last
      lower = range.first
      difference = upper - lower

      if c == upper_var
        range = ((lower + difference/2 + 1)..upper)
      elsif c == lower_var
        if lower == 0
          range = (0..upper/2)
        else
          range = (lower..(upper - difference/2 - 1))
        end
      end

      return range.last if i == coded.length - 1 && c == upper_var
      return range.first if i == coded.length - 1 && c == lower_var
    end
  end
end
