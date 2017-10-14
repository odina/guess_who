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
      best_result = {
        score: 0,
        parts: [],
        count: 0
      }

      strings.each do |str|
        Tokenizer.tokenize!(str) do |tokens|
          Scorer.score!(token) do |score|
            Comparator.better?(score, best, tokens.count)
            # best = Comparator.better?(score, best, tokens.count)
          end
        end
      end

      best_result[:parts].each do |part|
        full_name_arr << part
      end

      @full_name = full_name_arr.join(" ")

      self
    end
  end
end
