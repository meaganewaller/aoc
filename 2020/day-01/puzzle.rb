require 'pry'
require 'pry-nav'
class Puzzle

  def self.find_doubles(input,sum)
    n = input.length
    (0...n-1).each do |i|
      ((i + 1)...n).each do |j|
        if input[i] + input[j] == sum
          return input[i] * input[j]
        end
      end
    end
  end

  def self.find_triplets(input, sum)
    n = input.length
    (0...n-2).each do |i|
      ((i + 1)...n - 1).each do |j|
        ((j + 1)...n).each do |k|
          if input[i] + input[j] + input[k] == sum
            return input[i] * input[j] * input[k]
          end
        end
      end
    end
  end
end