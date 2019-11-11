require 'net/http'
require 'json'

class GamesController < ApplicationController

  def new
    charset = Array('A'..'Z')
    @letters = Array.new(7) { charset.sample }
  end


  def score

    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @raw = JSON.parse(response)

    if @raw["found"] == true
      @response = "Congrats!#{@word} is a valid word"
      @score += @raw["length"]
    else
      @response = "#{@word} is an invalid word!"
    end

  end
end

