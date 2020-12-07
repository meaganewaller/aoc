require 'spec_helper'
require './day-05/puzzle'

describe Puzzle do
  it "finds the correct seat id" do
    expect(Puzzle.find_seat("BFFFBBFRRR")).to eql [70, 7]
    expect(Puzzle.find_seat("FFFBBBFRRR")).to eql [14, 7]
    expect(Puzzle.find_seat("BBFFBBFRLL")).to eql [102, 4]

    expect(Puzzle.solve_part_one(["BFFFBBFRRR", "FFFBBBFRRR", "BBFFBBFRLL"])).to eql 820
  end

  xit "solves part one" do
    boarding_passes = File.readlines('./day-05/input.txt').map(&:strip)
    expect(Puzzle.solve_part_one(boarding_passes)).to eql ""
  end

  xit "solves part two" do
    boarding_passes = File.readlines('./day-05/input.txt').map(&:strip)
    expect(Puzzle.solve_part_two(boarding_passes)).to eql ""
  end
end
