require 'spec_helper'
require './day-09/puzzle'

describe Puzzle do
  it "returns the correct number" do
    file = File.open('./spec/day-09/test_input.txt')
    list = file.read.split("\n").map(&:to_i)
    expect(Puzzle.part_one(preamble_size: 5, list: list)).to eql 127
  end

  xit "returns the correct number" do
    file = File.open('./day-09/input.txt')
    list = file.read.split("\n").map(&:to_i)
    expect(Puzzle.part_one(preamble_size: 25, list: list)).to eql
  end

  it "returns the encryption weakness sum" do
    file = File.open('./spec/day-09/test_input.txt')
    list = file.read.split("\n").map(&:to_i)
    invalid_number = Puzzle.part_one(preamble_size: 5, list: list)
    expect(Puzzle.part_two(list: list, invalid_number: invalid_number)).to eql 62
  end

  xit "returns the encryption weakness sum" do
    file = File.open('./day-09/input.txt')
    list = file.read.split("\n").map(&:to_i)
    invalid_number = Puzzle.part_one(preamble_size: 25, list: list)
    expect(Puzzle.part_two(list: list, invalid_number: invalid_number)).to eql
  end
end
