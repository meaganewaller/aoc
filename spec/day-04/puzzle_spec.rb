require 'spec_helper'
require './day-04/puzzle'

describe Puzzle do
  it "returns count of valid passports" do
    passports = Puzzle.passportify_input("./spec/day-04/test_input.txt")
    expect(Puzzle.count_valid_passports(passports)).to eql 2
  end

  xit "returns count of valid passports" do
    passports = Puzzle.passportify_input("./day-04/input.txt")
    expect(Puzzle.count_valid_passports(passports)).to eql ___
  end
end
