require "amatch"

module GuessWho
  module NamesLoader
    def self.load!
      names = []
      names_by_first_letter = {}

      filenames = [
        "files/initials.txt",
        "files/females.txt",
        "files/males.txt",
        "files/surnames.txt"
      ]

      filenames.each do |filename|
        path = File.join(File.dirname(__FILE__), '../../', filename)
        f = File.open(path, "r")
        f.each_line do |l|
          name = l.split(" ")[0]
          first_char = name[0].downcase
          names << name
          names_by_first_letter[first_char] ||= []
          names_by_first_letter[first_char] << name
        end
        f.close
      end

      @@names = names
      @@names_by_first_letter = names_by_first_letter
    end

    def self.names; @@names; end
    def self.names_by_first_letter(letter); @@names_by_first_letter[letter] || []; end
  end
end
