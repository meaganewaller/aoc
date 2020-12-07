class Puzzle
  def self.count_answers(responses)
    responses.map do |response|
      response.join.split("").uniq.length
    end.reduce(&:+)
  end

  def self.count_consensus_answers(responses)
    responses.map do |response|
      responses_expecting = response.length
      response.join.split("").tally.select do |k, v|
        v == responses_expecting
      end.keys.length
    end.reduce(&:+)
  end
end
