require 'spec_helper'
require './day-08/puzzle'

describe Puzzle do
  it "accumulates the value correctly" do
    file = File.open('./spec/day-08/test_input.txt')
    instructions = file.read.split("\n")
    zipped = Puzzle.zip_instructions(instructions)
    expect(Puzzle.part_one(zipped)[0]).to eql 5
  end

  xit "accumulates value correctly for the puzzle input" do
    file = File.open('./day-08/input.txt')
    instructions = file.read.split("\n")
    zipped = Puzzle.zip_instructions(instructions)

    expect(Puzzle.part_one(zipped)[0]).to eql ___
  end

  it "finds the value to change and accumulates correctly!" do
    file = File.open('./spec/day-08/test_input.txt')
    instructions = file.read.split("\n")
    zipped = Puzzle.zip_instructions(instructions)

    expect(Puzzle.part_two(zipped)).to eql 8
  end

  xit "finds the value to change and accumulates correctly for the puzzle input" do
    file = File.open('./day-08/input.txt')
    instructions = file.read.split("\n")
    zipped = Puzzle.zip_instructions(instructions)

    expect(Puzzle.part_two(zipped)).to eql ___
  end
end
