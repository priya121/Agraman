require 'ruby-dictionary'

class Anagram

    def initialize(input, output)
        @input = input
        @output = output
    end

    def start()
        @output.puts "\nEnter the word you would like an anagram for:"
        letters = split(@input.gets.to_s)
        possible_combos = combos(letters)
        anagrams = check(possible_combos)
        list_of_anagrams = convert_to_string(anagrams)
        @output.puts "Here are your anagrams:\n#{list_of_anagrams}"
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
        combos.each do |word|
         if dictionary.exists?(word)
             real_words << word
         end
        end
        real_words.uniq
    end

    def convert_to_string(array_of_words)
        result  = ""
        array_of_words.each do |word|
            result += word.downcase
        end
        result
    end
end
