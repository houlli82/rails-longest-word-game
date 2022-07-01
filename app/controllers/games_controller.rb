require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    # binding.pry
    @letters = params[:letters].split(',')
    @answer = params[:answer]
    @url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    @reader = JSON.parse(URI.open(@url).read)
    @answer_split = @answer.split('')
    @match = @answer_split.all? { |all_of_answer| @letters.include?(all_of_answer) }
  end

end
