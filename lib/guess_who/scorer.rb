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
        first_char = token[0][0]
        names = NamesLoader.names_by_first_letter(first_char.downcase)
        m = Amatch::JaroWinkler.new(token)

        score += names.map do |name|
          m.match(name)
        end.max
      end

      score /= @token_array.length
      score
    end
  end
end
