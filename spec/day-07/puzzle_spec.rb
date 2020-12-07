require 'spec_helper'
require './day-07/puzzle'
require 'pry'
require 'pry-nav'

describe Puzzle do
  it "returns 4 for example rules" do
    file = File.open('./spec/day-07/test_input.txt')
    rules = file.read.split("\n")
    hashed_rules = Puzzle.clean_rules(rules)
    puzzled = Puzzle.get_bag_containers_count(hashed_rules, "shiny gold")
    expect(puzzled).to eql 4
  end

  it "returns for puzzle" do
    file = File.open('./day-07/input.txt')
    rules = file.read.split("\n")
    hashed_rules = Puzzle.clean_rules(rules)

    puzzled = Puzzle.get_bag_containers_count(hashed_rules, "shiny gold")
    expect(puzzled).to eql 144
  end

  it "counts how many bags a bag contains" do
    file = File.open('./spec/day-07/test_input.txt')
    rules = file.read.split("\n")
    hashed_rules = Puzzle.clean_rules(rules)
    puzzled = Puzzle.get_all_bag_count(hashed_rules, "shiny gold")
    expect(puzzled).to eql 32
  end

  it "counts how many bags a bag contains" do
    file = File.open('./day-07/input.txt')
    rules = file.read.split("\n")
    hashed_rules = Puzzle.clean_rules(rules)
    puzzled = Puzzle.get_all_bag_count(hashed_rules, "shiny gold")
    expect(puzzled).to eql 5956
  end
end
