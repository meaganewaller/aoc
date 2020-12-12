class Puzzle
  def self.part_one(chart)
    chart_dupe = chart.dup

    new_chart = chart_dupe.map.with_index do |seats, row|
      seats.map.with_index do |seat, col|
        adjacent_seat_plots = [[col, row-1], [col, row+1], [col-1, row], [col+1, row],
                              [col-1, row+1], [col+1, row+1], [col-1, row-1], [col+1, row-1]]

        potential_seats = adjacent_seat_plots.reject do |plot|
          plot.include?(-1) ||
          plot[0] >= chart_dupe.size ||
          plot[1] >= seats.size
        end

        adjacent_seats = potential_seats.map do |ps|
          chart_dupe[ps[1]][ps[0]]
        end

        if seat == "."
          "."
        elsif seat == "L" && adjacent_seats.count("#") == 0
          "#"
        elsif seat == "#" && adjacent_seats.count("#") >= 4
          "L"
        else
          seat
        end
      end
    end

    if new_chart == chart_dupe
      return new_chart.map { |c| c.count("#") }.reduce(&:+)
    else
      part_one(new_chart)
    end
  end

  def self.part_two(chart)
    chart_dupe = chart.dup

    new_chart = chart_dupe.map.with_index do |seats, row|
      seats.map.with_index do |seat, col|
        adjacent_less_row = seats.values_at(0...col).reverse.reject { |s| s == "." }[0] == "#"
        adjacent_greater_row = seats.values_at(col+1...seats.size).reject { |s| s == "." }[0] == "#"
        column = chart_dupe.transpose[col]
        adjacent_less_col = column.values_at(0...row).reverse.reject { |s| s == "." }[0] == "#"
        adjacent_greater_col = column.values_at(row+1...column.size).reject { |s| s == "." }[0] == "#"

        adjacent_diagonal_one_seats = false
        adjacent_diagonal_two_seats = false
        adjacent_diagonal_three_seats = false
        adjacent_diagonal_four_seats = false

        # [row - 1, col - 1]
        new_row = row - 1
        new_col = col - 1

        while new_row >= 0 && new_col >= 0
          if chart_dupe[new_row][new_col] == "#"
            adjacent_diagonal_one_seats = true
            break
          elsif chart_dupe[new_row][new_col] == "L"
            break
          end
          new_row -= 1
          new_col -= 1
        end

        # [row + 1, col - 1]
        new_row = row + 1
        new_col = col - 1
        while new_row < chart_dupe.size && new_col >= 0
          if chart_dupe[new_row][new_col] == "#"
            adjacent_diagonal_two_seats = true
            break
          elsif chart_dupe[new_row][new_col] == "L"
            break
          end
          new_row += 1
          new_col -= 1
        end

       # [ row + 1, col + 1]
        new_row = row + 1
        new_col = col + 1
        while new_row < chart_dupe.size && new_col < seats.size
          if chart_dupe[new_row][new_col] == "#"
            adjacent_diagonal_three_seats = true
            break
          elsif chart_dupe[new_row][new_col] == "L"
            break
          end
          new_row += 1
          new_col += 1
        end

        # [ row - 1, col + 1]
        new_row = row - 1
        new_col = col + 1
        while new_row >= 0 && new_col < seats.size
          if chart_dupe[new_row][new_col] == "#"
            adjacent_diagonal_four_seats = true
            break
          elsif chart_dupe[new_row][new_col] == "L"
            break
          end
          new_row -= 1
          new_col += 1
        end

        adj_occupied = [adjacent_diagonal_four_seats,
          adjacent_diagonal_one_seats,
          adjacent_diagonal_three_seats,
          adjacent_diagonal_two_seats,
          adjacent_greater_row,
          adjacent_less_row,
          adjacent_greater_col,
          adjacent_less_col]

        if seat == "."
          "."
        elsif seat == "L" && adj_occupied.count(true) == 0
          "#"
        elsif seat == "#" && adj_occupied.count(true) >= 5
          "L"
        else
          seat
        end
      end
    end

    if new_chart == chart_dupe
      return new_chart.map { |c| c.count("#") }.reduce(&:+)
    else
      part_two(new_chart)
    end
  end
end
