#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'name_anagrams'

Anagram.new(Kernel, Kernel).start


