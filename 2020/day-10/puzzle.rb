class Puzzle
  def self.part_one(list)
    list = list.sort.insert(0, 0)
    final_jolt = list[-1] + 3
    diffs = [*list, final_jolt].each_cons(2).map { |a, b| b - a }
    diffs.count(1) * diffs.count(3)
  end

  def self.part_two(list)
    list = list.sort.insert(0, 0)
    paths = Hash.new(0)
    paths[0] = 1
    final_jolt = list[-1] + 3

    list.each do |l|
      [1, 2, 3].each do |j|
        if ([*list,final_jolt].include?(l+j))
          paths[l+j] += paths[l]
        end
      end
    end

    paths[final_jolt]
  end
end
