class Puzzle
  def self.part_one(preamble_size:, list:)
    preamble = list.first(preamble_size)
    all_sums = preamble.map.with_index do |x, i|
      preamble[i+1..-1].map do |y|
        x + y
      end
    end.flatten

    return list[preamble_size] if !all_sums.include?(list[preamble_size])
    part_one(preamble_size: preamble_size, list: list.drop(1))
  end

  def self.part_two(list:, invalid_number:)
    range = []
    possible_list = list.reject { |n| n >= invalid_number }

    duped_possible_list = possible_list.dup
    start = duped_possible_list.shift
    range << start
    x = start

    while x <= invalid_number
      if x < invalid_number
        shifted = duped_possible_list.shift
        x += shifted
        range << shifted
      elsif x == invalid_number
        return range.min + range.max
      end
    end

    part_two(list: possible_list.drop(1), invalid_number: invalid_number)
  end
end
