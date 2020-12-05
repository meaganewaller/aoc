require 'pry'
require 'pry-nav'


class Puzzle
  def self.solve_part_one(passes)
    get_all_seat_ids(passes).last
  end

  def self.get_all_seat_ids(passes)
    seat_ids = passes.map do |pass|
      seat = Puzzle.find_seat(pass)
      Puzzle.find_seat_id(seat)
    end.sort
  end

  def self.solve_part_two(passes)
    seats = passes.map do |pass|
      find_seat(pass)
    end.sort


    all_seat_ids = get_all_seat_ids(passes)
    the_seat = nil
    # Group the array such that an array that looks like:
    # [[2, 6], [2, 7], [2, 4], [4, 5]]
    # Turns into:
    # {2 => [2,6], [2,7], [2,4]], 4 => [[4, 5]]}
    grouped_seats = seats.group_by { |s| s[0] }
    binding.pry

    # From the grouped, select the objects where there are fewer
    # than 8 values, this means there are open seats in that row (the key is the row)
    narrowed_group = grouped_seats.select {|k, v| v.count < 8 }
    rows_with_empty_seats = narrowed_group.keys

    rows_with_empty_seats.each do |row|
      taken_seats = narrowed_group[row].map do |seat|
        seat[1]
      end

      open_seats = (1..7).to_a - taken_seats

      open_seats.each do |s|
        seat_id = find_seat_id([row, s])
        if all_seat_ids.include?(seat_id + 1) && all_seat_ids.include?(seat_id - 1)
          the_seat = [row, s]
        end
      end
    end

    return find_seat_id(the_seat)
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
