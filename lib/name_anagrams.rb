require 'ruby-dictionary'

class Anagram

    def initialize(input, output)
        @input = input
        @output = output
    end

    def start()
        @output.puts "\nEnter the word you would like an anagram for:"
        user_input = @input.gets.chomp.to_s
        letters = split(user_input)
        possible_combos = combos(letters)
        anagrams = check(possible_combos)
        list_of_anagrams = convert_to_string(anagrams)
        anagram_exists(list_of_anagrams, user_input)

        replay_game
        @output.puts "Byeeeee"
    end

    def anagram_exists(list_of_anagrams, user_input)
        if list_of_anagrams.length == 0
            @output.puts "There are no anagrams for the name #{user_input} sorry :("
        else
        @output.puts "\n\nHere are your anagrams for #{user_input}:" +
        "\n#{list_of_anagrams}\n"
        end
    end

    def replay_game
        @output.puts "\nWould you like to try another name?(Y/N)"
        if @input.gets.chomp.to_s == "Y"
            start
        end
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
        real_words.delete_at(0)
        real_words.uniq
    end

    def convert_to_string(array_of_words)
        result  = ""
        array_of_words.each do |word|
            result += word.downcase + " "
        end
        result
    end
end
