module GuessWho
  module Comparator
    def self.better?(contender, best, contender_length, best_length)
      if contender >= best
        if contender == best # if the same score, go with simpler option
          contender_length <= best_length
        else # if not the same score, we have a winner!
          true
        end
      end
    end
  end
end
