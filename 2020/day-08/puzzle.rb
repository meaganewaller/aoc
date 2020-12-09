class Puzzle
  def self.zip_instructions(input)
    keys = (0...input.size)
    keys.zip(input).to_h
  end

  def self.part_one(instructions, visiting=0, visited=[], acc=0)
    return [acc, visiting] if (visited.include?(visiting) || visiting > instructions.keys.last)

    visited << visiting
    op, arg = instructions[visiting].split
    direction, number = [arg.chars.first, arg.chars[1..-1].join.to_i]

    visiting += 1 if op == "nop"

    if op == "acc"
      acc = acc.send("#{direction}", number)
      visiting += 1
    elsif op == "jmp"
      visiting = visiting.send("#{direction}", number)
    end

    part_one(instructions, visiting, visited, acc)
  end

  def self.part_two(instructions, tries=[])
    instructions_dupe = instructions.dup

    attemptable = instructions.select { |k, v| !v.include?("acc") }.keys
    unattempted = attemptable - tries

    attempting = unattempted.shift

    if instructions_dupe[attempting].include?("nop")
      new_instruction = instructions_dupe[attempting].gsub("nop", "jmp")
    else
      new_instruction =instructions_dupe[attempting].gsub("jmp", "nop")
    end

    instructions_dupe[attempting] = new_instruction
    tries << attempting

    returned = part_one(instructions_dupe)
    if returned[1] > instructions.keys.last
      return returned[0]
    end
    part_two(instructions, tries)
  end
end
