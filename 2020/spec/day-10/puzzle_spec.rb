require 'spec_helper'
require './day-10/puzzle'

describe Puzzle do
  it "returns the correct output for test input" do
    file = File.open('./spec/day-10/test_input.txt')
    list = file.read.split("\n").map(&:to_i)
    expect(Puzzle.part_one(list)).to eql 220
  end

  xit "returns the correct output for puzzle input" do
    file = File.open('./day-10/input.txt')
    list = file.read.split("\n").map(&:to_i)
    expect(Puzzle.part_one(list)).to eql ___
  end

  it "returns the correct output for test input" do
    file = File.open('./spec/day-10/test_input.txt')
    list = file.read.split("\n").map(&:to_i)
    expect(Puzzle.part_two(list)).to eql 19208
  end

  xit "returns the correct output for test input" do
    file = File.open('./day-10/input.txt')
    list = file.read.split("\n").map(&:to_i)
    expect(Puzzle.part_two(list)).to eql ___
  end
end
