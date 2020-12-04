require 'pry'
require 'pry-nav'
class Puzzle
  def self.passportify_input(path)
    file = File.open(path)
    file_data = file.read
    passports = file_data.split("\n\n")
    passports.map(&:split)
  end

  def self.count_valid_passports(passports)
    # First do a basic select to only grab passports with
    # atleast 7 elements we will know right away its invalid
    # if it has fewer
    potentially_valid = passports.each.select do |passport|
      passport.size >= 7
    end

    # Joining them together for easier string matching
    joined_potentially_valid = potentially_valid.map do |passport|
      passport.join(",")
    end

    # Set up what keys are expected:
    expected_keys = %w(byr cid ecl eyr hcl hgt iyr pid)

    # Real brute force here, make sure each string in the passport contains the expected keys
    valid = joined_potentially_valid.select do |passport|
      if !passport.include?(expected_keys[1])
        passport.include?(expected_keys[0]) &&
        passport.include?(expected_keys[2]) &&
        passport.include?(expected_keys[3]) &&
        passport.include?(expected_keys[4]) &&
        passport.include?(expected_keys[5]) &&
        passport.include?(expected_keys[6]) &&
        passport.include?(expected_keys[7])
      else
        passport.include?(expected_keys[0]) &&
        passport.include?(expected_keys[1]) &&
        passport.include?(expected_keys[2]) &&
        passport.include?(expected_keys[3]) &&
        passport.include?(expected_keys[4]) &&
        passport.include?(expected_keys[5]) &&
        passport.include?(expected_keys[6]) &&
        passport.include?(expected_keys[7])
      end
    end.count
  end
end
