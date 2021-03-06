#!/usr/bin/env ruby
require 'json'
require 'open-uri'
require 'sinatra'

class APICalls
  attr_reader :accessor

  def initialize(input)
    @input = input
  end
  
  def sindarin_api
    url = "https://api.funtranslations.com/translate/sindarin.json?text=#{@input}"
    json_return(url)
  end

  def quenya_api
    url = "https://api.funtranslations.com/translate/quenya.json?text=#{@input}"
    json_return(url)
  end

  def orcish_api
    url = "https://api.funtranslations.com/translate/orcish.json?text=#{@input}"
    json_return(url)
  end 

  private 

  def json_return(url)
    url_serialized = open(url).read
    api = user = JSON.parse(url_serialized)
  end
end

class Translation
  def initialize(result)
    @result = result
  end

  def translation
    contents = @result["contents"]
    puts contents["translated"]
  end
end

# def run_programme
#   result = ""
#   running = true
#   while running == true 
#     puts "Which language would you like to explore"
#     puts "1 - Sindarin"
#     puts "2 - Quenya"
#     puts "3 - Orcish"
#     puts "4 - Exit programme"
#     choice = gets.chomp

#     puts "What would you like to translate?"
#     input = gets.chomp
#     case choice
#     when "1"
#       result = APICalls.new(input).sindarin_api
#     when "2"
#       result = APICalls.new(input).quenya_api
#     when "3"
#       result = APICalls.new(input).orcish_api
#     when "4"
#       running = false
#     end
#     return Translation.new(result).translation
#   end
# end
# run_programme

input = "hello"
result = APICalls.new(input).sindarin_api
translation = Translation.new(result)

get '/' do
  "Your search was for #{input}"
  "And this translates to #{translation}"
end