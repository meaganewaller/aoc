require 'pry'
require 'pry-nav'

class Puzzle
  attr_reader :bag_type, :rules

  def self.clean_rules(rules)
    rules.map do |rule|
      rule.gsub!(".", "") &&
      rule.gsub!("bags", "") &&
      rule.gsub!("bag", "")
    end

    rules = rules.map { |r| r.split("contain").map(&:strip).map { |rr| rr.split(",")} }
    hashed_rules = {}

    rules.each do |r|
      hashed_rules[r[0][0]] = r[1].map(&:strip).flatten
    end

    return hashed_rules
  end

  def self.get_bag_count(rules, bag_type)
    find_bag_containers(rules, bag_type).flatten.uniq.count
  end

  def self.find_bag_containers(rules, bag_type, all_containers=[])
    selected = rules.select do |k, v|
      v.to_s.include?(bag_type)
    end.keys

    if selected.empty?
      return all_containers
    end
    # return all_containers if selected.empty?

    all_containers << selected

    selected.map do |bag_color|
      Puzzle.find_bag_containers(rules, bag_color, all_containers)
    end
  end
end
