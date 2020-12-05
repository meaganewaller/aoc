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
    valid_with_fields = joined_potentially_valid.select do |passport|
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
    end

    # Hashify passports for easier look at data
    split_valid = valid_with_fields.map { |v| v.split(",") }
    passport_as_hashes = split_valid.each.map { |p| p.map { |pp| pp.split(":")} }.map { |s| s.to_h }

    passport_as_hashes.select do |passport|
      valid_passport?(passport)
    end.count
  end

  def self.valid_passport?(passport)
    valid_birth_year(passport["byr"]) &&
    valid_issue_year(passport["iyr"]) &&
    valid_expiration_year(passport["eyr"]) &&
    valid_height(passport["hgt"]) &&
    valid_hair_color(passport["hcl"]) &&
    valid_eye_color(passport["ecl"]) &&
    valid_passport_id(passport["pid"])
  end

  def self.valid_birth_year(birth_year)
    birth_year.to_i >= 1920 && birth_year.to_i <= 2002
  end

  def self.valid_issue_year(issue_year)
    issue_year.to_i >= 2010 && issue_year.to_i <= 2020
  end

  def self.valid_expiration_year(exp_year)
    exp_year.to_i >= 2020 && exp_year.to_i <= 2030
  end

  def self.valid_height(height)
    if height.end_with?("cm")
      height.split("cm")[0].to_i >= 150 && height.split("cm")[0].to_i <= 193
    elsif height.end_with?("in")
      height.split("in")[0].to_i >= 59 && height.split("in")[0].to_i <= 76
    end
  end

  def self.valid_hair_color(hair_color)
    hair_color.match(/^#[0-9a-f]{6}$/i) && hair_color.match(/^#[0-9a-f]{6}$/i).length > 0
  end

  def self.valid_eye_color(eye_color)
    options = %w(amb blu brn gry grn hzl oth)
    options.include?(eye_color)
  end

  def self.valid_passport_id(pid)
    pid.length == 9 &&
    pid.match(/^[0-9]{9}/) &&
    pid.match(/^[0-9]{9}/).length  > 0
  end
end
