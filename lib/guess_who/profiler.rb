module GuessWho
  class Profiler
    attr_reader :full_name,
                :email

    def self.profile!(email)
      self.new(email).profile!
    end

    def initialize(email)
      @email = email
      @full_name = ""
    end

    def profile!
      full_name_arr = []
      raw_str = email.split("@")[0]
      strings = raw_str.split(/[^a-zA-Z]/)
      best = {
        score: 0,
        parts: [],
        count: 0
      }

      strings.each do |str|
        token_arrays = Tokenizer.tokenize!(str)

        Scorer.score!(token_arrays) do |score, tokens|
          is_better = Comparator.better?(score,
                                         best[:score],
                                         tokens.size,
                                         best[:count])
          if is_better
            best = {
              score: score,
              parts: tokens,
              count: tokens.size
            }
          end
        end
      end

      best[:parts].each do |part|
        full_name_arr << part.capitalize
      end

      @full_name = full_name_arr.join(" ")

      self
    end
  end
end
