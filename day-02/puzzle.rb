class Puzzle
  def self.valid_passwords_part_one(input)
    input.select do |i|
      min = i[0]
      max = i[1]
      letter = i[2]
      password = i[3]
      # Gives a hash where key is letter in the password and value is number of times it shows up
      # i.e., for a password of 'abcde' get a hash of { "a" => 1, "b" => 1, "c" => 1, "d" => 1, "e" => 1 }
      hashed_password = Hash[password.split("").group_by { |c| c }.map {|k, v| [k, v.size]}]
      if hashed_password[letter]
        hashed_password[letter] >= min && hashed_password[letter] <= max
      end
    end.count
  end

  def self.valid_passwords_part_two(input)
    # For part two, our array shape can stay the same, but the values mean different things now
    input.select do |i|
      first_index = i[0]
      second_index = i[1]
      letter = i[2]
      password = i[3]

      password_array = password.split("")
      (password_array[first_index-1] == letter && password_array[second_index-1] != letter) ||
        (password_array[second_index-1] == letter && password_array[first_index-1] != letter)
    end.count
  end

  def self.clean_input(input)
    # Create an array of arrays with this shape
    # [min, max, letter, password]
    input.map do |i|
      i[1] = i[1].delete(":")
      i[0] = i[0].split("-").map(&:to_i)
      i.flatten!
    end

    return input
  end
end
