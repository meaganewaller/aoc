require 'spec_helper'
require './day-01/puzzle'

describe Puzzle do
  it "finds the two elements that sum to 2020 and multiplys them" do
    input = [1721, 979, 366, 299, 675, 1456]
    expect(Puzzle.find_doubles(input, 2020)).to eql 514579
  end

  it "finds the two elements that sum to 2020 and multiplys them" do
    input = [1725, 979, 2019, 299, 675, 1]
    expect(Puzzle.find_doubles(input, 2020)).to eql 2019
  end

  it "solves the puzzle" do
    input = File.readlines('./day-01/input.txt').map(&:to_i)
    expect(Puzzle.find_doubles(input, 2020)).to eql 927684
  end

  it "finds three elements" do
    input = [1721, 979, 366, 299, 675, 1456]
    expect(Puzzle.find_triplets(input, 2020)).to eql 241861950
  end

  it "solves the puzzle for three elements" do
    input = File.readlines('./day-01/input.txt').map(&:to_i)
    expect(Puzzle.find_triplets(input, 2020)).to eql 292093004
  end
end