require 'spec_helper'
require './day-02/puzzle'

describe Puzzle do
  it "converts input to useful arrays" do
    input = File.readlines('./day-02/input.txt').map(&:strip).map(&:split)
    cleaned_input = Puzzle.clean_input(input)
    expect(cleaned_input[0]).to eql [5, 10, "b", "bhbjlkbbbbbbb"]
  end

  context "part one" do
    it "returns count of valid passwords" do
      input = [
        [1, 3, "a", "abcde"],
        [1, 3, "b", "cdefg"],
        [2, 9, "c", "ccccccccc"]
      ]

      expect(Puzzle.valid_passwords_part_one(input)).to eql 2
    end

    # Pending test as to not publish the answer
    xit "returns count of valid passwords from input" do
      input = File.readlines('./day-02/input.txt').map(&:strip).map(&:split)
      cleaned_input = Puzzle.clean_input(input)
      expect(Puzzle.valid_passwords_part_one(cleaned_input)).to eql
    end
  end

  context "part two" do

    it "returns count of valid passwords" do
      input = [
        [1, 3, "a", "abcde"],
        [1, 3, "b", "cdefg"],
        [2, 9, "c", "ccccccccc"]
      ]

      expect(Puzzle.valid_passwords_part_two(input)).to eql 1
    end

    # Pending test as to not publish the answer
    xit "returns count of valid passwords from input" do
      input = File.readlines('./day-02/input.txt').map(&:strip).map(&:split)
      cleaned_input = Puzzle.clean_input(input)
      expect(Puzzle.valid_passwords_part_two(cleaned_input)).to eql
    end
  end
end