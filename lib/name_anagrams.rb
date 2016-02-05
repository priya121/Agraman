require 'ruby-dictionary'

class Anagram
    def split(word)
        word.split(//)
    end

    def combos(letters)
        letters.permutation.map &:join
    end

    def check(combos)
        real_words = []
        dictionary = Dictionary.from_file('words')
        combos.select do |word|
         if dictionary.exists?(word)
             real_words << word
         end
        end
        real_words.uniq
    end
end
