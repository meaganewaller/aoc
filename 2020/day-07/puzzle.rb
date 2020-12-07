class Puzzle
  def self.clean_rules(rules)
    rules.map do |rule|
      rule.gsub!(".", "") && rule.gsub!("bags", "") && rule.gsub!("bag", "")
    end

    rules = rules.map { |r| r.split("contain").map(&:strip).map { |rr| rr.split(",")} }

    rules.each_with_object({}) do |r, hsh|
      hsh[r[0][0]] = r[1].map do |rr|
        amt = rr[/\d+/]
        rr = rr.split(amt).map(&:strip).reject(&:empty?)
        [*rr] * amt.to_i
      end.flatten
    end
  end

  def self.get_all_bag_count(rules, bag_type, counts=[])
    rules[bag_type].each do |bt|
      counts << 1
      get_all_bag_count(rules, bt, counts)
    end

    return counts.reduce(&:+)
  end

  def self.get_bag_containers_count(rules, bag_type)
    find_bag_containers(rules, bag_type).flatten.uniq.count
  end

  def self.find_bag_containers(rules, bag_type, all_containers=[])
    selected = rules.select do |k, v|
      v.to_s.include?(bag_type)
    end.keys

    return all_containers if selected.empty?

    all_containers << selected
    selected.map do |bag_color|
      find_bag_containers(rules, bag_color, all_containers)
    end
  end
end
