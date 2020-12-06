class Puzzle
  def self.count_answers(responses)
    responses.map do |response|
      response.join.split("").uniq.length
    end.reduce(&:+)
  end
end
