module GuessWho
  class Tokenizer
    def self.tokenize!(str)
      self.new(str).tokenize!
    end

    def initialize(str)
      @raw_str = str
    end

    def tokenize!
      tokens = []

      (0..@raw_str.size-1).each do |i|
        str = @raw_str.clone
        possible_firstname = str.slice(0..i)

        (possible_firstname.length..str.length).each do |j|
          combination = str.scan(/(?=(#{possible_firstname})([a-zA-Z]{,#{j}})([a-zA-Z]*))/)
          combination = combination.flatten.reject(&:empty?)
          tokens << combination if combination.any?
        end
      end

      tokens.uniq!
    end
  end
end
