module GuessWho
  class Scorer
    def self.score!(token_arrays, &block)
      scores = []

      token_arrays.each do |token_array|
        scorer = Scorer.new(token_array)
        score = scorer.score!
        yield score, token_array
      end

      scores
    end

    def initialize(token_array)
      @token_array = token_array
    end

    def score!
      score = 0

      @token_array.each do |token|
        m = Amatch::JaroWinkler.new(token)

        score += NamesLoader.names.map do |name|
          m.match(name)
        end.max
      end

      score /= @token_array.length
      score
    end
  end
end
