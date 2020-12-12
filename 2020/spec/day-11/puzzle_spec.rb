require 'spec_helper'
require './day-11/puzzle'

describe Puzzle do
  it "solves for part one for test input" do
    chart = File.readlines('./spec/day-11/input.txt').map(&:strip).map { |r| r.split("") }
    expect(Puzzle.part_one(chart)).to eql 37
  end

  xit "solves for part one for input" do
    chart = File.readlines('./day-11/input.txt').map(&:strip).map { |r| r.split("") }
    expect(Puzzle.part_one(chart)).to eql ___
  end

  it "solves for part two for test input" do
    chart = File.readlines('./spec/day-11/input.txt').map(&:strip).map { |r| r.split("") }
    expect(Puzzle.part_two(chart)).to eql 26
  end

  xit "solves for part two for input" do
    chart = File.readlines('./day-11/input.txt').map(&:strip).map { |r| r.split("") }
    expect(Puzzle.part_two(chart)).to eql ___
  end
end
