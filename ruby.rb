#!/usr/bin/env ruby
require 'json'
require 'open-uri'

def api_call(input)
  url = "https://api.funtranslations.com/translate/sindarin.json?text=#{input}"
  url_serialized = open(url).read
  api = user = JSON.parse(url_serialized)
end

def translation(result)
  contents = result["contents"]
  puts contents["translated"]
end

puts "What would you like to translate?"
input = gets.chomp
result = api_call(input)
translation(result)