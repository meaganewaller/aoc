class Puzzle
  def self.part_one(list, current_jolt = 0, diffs=[3])
    sorted = list.sort
    jolt_diff = sorted[0] - current_jolt

    diffs << jolt_diff

    if sorted.size == 1
      return diffs.count(1) * diffs.count(3)
    else
      current_jolt = sorted[0]
      part_one(sorted.drop(1), current_jolt, diffs)
    end
  end

  def self.part_two(list)
    # Put a zero at the front of the first
    list = list.sort.insert(0, 0)
    paths = Hash.new(0)
    paths[0] = 1
    final_jolt = list[-1] + 3

    list.each do |l|
      [1, 2, 3].each do |m|
        if ([*list,final_jolt].include?(l+m))
          paths[l+m] += paths[l]
        end
      end
    end

    paths[final_jolt]
  end
end
