class GachasController < ApplicationController
  def index
  end

  def result
    movies = Movie.all
      .by_classification(params[:classification])
      .by_category(params[:category])
      .by_mood(params[:mood])

    @movie = movies.sample
    @params = params.permit(:classification, :category, :mood)
  end
end
