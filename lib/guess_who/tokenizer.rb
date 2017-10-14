module GuessWho
  class Tokenizer
    def self.tokenize!(str)
      self.new(str).tokenize!
    end

    def initialize(str)
      @raw_str = str
    end

    def tokenize!
    end
  end
end
