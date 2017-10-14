module GuessWho
  module Scorer
    def self.score!(tokens)
      scores = []

      tokens.each do |token|
        scorer = Scorer.new(token)
        scores << scorer.score!
      end

      scores
    end

    def initialize(token)
      @token = token
    end

    def score!
    end
  end
end
