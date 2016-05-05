class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(rank: :asc)
  end

  def new
    @movie = Movie.new

  end 

  def create
    @movie = Movie.create(movie_params)
    if @movie.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end 
  end 

  def rankings
     @movies = Movie.all.order(rank: :asc)
  end

  def rankings_update
    @movies = Movie.all
    @movies.each do |movie|
      movie.update_attributes(movie_params)
    end
  redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :director, :cast, :description, :rank, :review)
  end 
end
