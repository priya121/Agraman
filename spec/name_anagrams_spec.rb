require "name_anagrams"

describe Anagram do

    let(:word) {Anagram.new}

    describe 'splits letters in a word' do
        it 'splits a three letter word into letters' do
        result = word.split("bat")
        expect(result).to eq ["b", "a", "t"]
        end

        it 'splits another three letter word into letters' do
            result = word.split("cat")
            expect(result).to eq ["c", "a", "t"]
        end

        it 'returns all possible combinations' do
            letters = word.split("bac")
            result = word.combos(letters)
            expect(result).to eq ["bac", "bca", "abc", "acb", "cba", "cab"]
        end

        it 'checks one word anagrams for bac' do
            letters = word.split("bac")
            combos = word.combos(letters)
            result = word.check(combos)
            expect(result).to eq ["bac","cab"]
        end

        it 'checks one word anagrams for angered' do
            letters = word.split("angered")
            combos = word.combos(letters)
            result = word.check(combos)
            expect(result).to eq ["gardeen", "gerenda", "grandee", "grenade", "enraged", "derange"]
        end

        it 'displays list of possible anagrams of daisy' do
            letters = word.split("daisy")
            combos = word.combos(letters)
            result = word.check(combos)
            expect(result).to eq ["daisy", "sayid"]
        end

        it 'displays list of possible anagrams of priya' do
            letters = word.split("daniel")
            combos = word.combos(letters)
            result = word.check(combos)
            expect(result).to eq []
        end
    end
end




