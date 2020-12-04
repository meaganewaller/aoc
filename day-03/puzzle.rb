class Puzzle
  def self.count_trees(arr)
    count = 0
    encountered = []
    arr.each_with_index do |v, i|
      if i == 0
        encountered << nil
        count += 3
        # As long as count is less than that the length of the line in the array
      elsif count <= v.length - 1
        # Add value at index to encountered array.
        encountered << v[count]
        # Before incrementing the count, make sure it's good to increment
        if count + 3 <= v.length - 1
          count += 3
        else
          leftover = v.length - 1 - count
          count = 2 - leftover
        end
      else
        leftover = v.length - 1 - count
        count = 2 - leftover
        encountered << v[count]
        count += 3
      end
    end

    encountered.select do |landed|
      landed == "#"
    end.count
  end
end
