require "amatch"

module GuessWho
  module NamesLoader
    def self.load!
      names = []

      filenames = [
        "files/initials.txt",
        "files/females.txt",
        "files/males.txt",
        "files/surnames.txt"
      ]

      filenames.each do |filename|
        f = File.open(filename, "r")
        f.each_line { |l| names << l.split(" ")[0] }
        f.close
      end

      @@names = names
    end

    def self.names; @@names; end
  end
end
