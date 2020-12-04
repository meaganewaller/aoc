class Puzzle
  def self.count_trees(arr, to_increment, to_go_down=1)
    count = 0
    encountered = []
    arr.each_with_index do |v, i|
      if to_go_down == 2 && i % 2 == 0 || to_go_down == 1
        if i == 0
          encountered << nil
          count += to_increment
          # As long as count is less than that the length of the line in the array
        elsif count <= v.length - 1
          # Add value at index to encountered array.
          encountered << v[count]
          # Before incrementing the count, make sure it's good to increment
          if count + to_increment <= v.length - 1
            count += to_increment
          else
            leftover = v.length - 1 - count
            count = to_increment - 1 - leftover
          end
        else
          leftover = v.length - 1 - count
          count = to_increment - 1 - leftover
          encountered << v[count]
          count += to_increment
        end
      end
    end

    encountered.select do |landed|
      landed == "#"
    end.count
  end
end
