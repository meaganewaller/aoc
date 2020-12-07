require 'spec_helper'
require './day-06/puzzle'

describe Puzzle do
  it "sums up how many yes answers there are" do
    file = File.open('./spec/day-06/test_input.txt')
    file_data = file.read
    answers = file_data.split("\n\n")
    responses = answers.map { |a| a.split }
    expect(Puzzle.count_answers(responses)).to eql 11
  end

  it "sums up how many yes answers there are consensus on in groups" do
    file = File.open('./spec/day-06/test_input.txt')
    file_data = file.read
    answers = file_data.split("\n\n")
    responses = answers.map { |a| a.split }

    expect(Puzzle.count_consensus_answers(responses)).to eql 6
  end

  xit "sums up how many yes answers there are consensus on in groups for puzzle input" do
    file = File.open('./day-06/input.txt')
    file_data = file.read
    answers = file_data.split("\n\n")
    responses = answers.map { |a| a.split }

    expect(Puzzle.count_consensus_answers(responses)).to eql ___
  end

  xit "sums up for the puzzle input" do
    file = File.open('./day-06/input.txt')
    file_data = file.read
    answers = file_data.split("\n\n")
    responses = answers.map { |a| a.split }
    expect(Puzzle.count_answers(responses)).to eql __
  end
end
