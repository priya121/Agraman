require 'ruby-dictionary'

class Anagram

    def initialize(input, output)
        @input = input
        @output = output
    end

    def start()
        letters = split(@input.gets.to_s)
        possible_combos = combos(letters)
        anagrams = check(possible_combos)
        result = convert_to_string(anagrams)
        @output.puts "Here are your anagrams:#{result}"
    end

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

    def convert_to_string(array_of_words)
        result  = ""
        array_of_words.each do |word|
            result += word
        end
        result
    end
end
