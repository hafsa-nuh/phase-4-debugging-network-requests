class MoviesController < ApplicationController
  
  def index
    movies = Movie.all
    render json: movies
  end
  def create
    # Debugging Server Errors
    # Movi instead of Movie
    #  movie = Movi.create(movie_params) => POST http://localhost:4000/movies
  # 500 (Internal Server Error)
  # NameError (uninitialized constant MoviesController::Movi):
  # app/controllers/movies_controller.rb:10:in 'create'
    movie = Movie.create(movie_params)
    render json: movie, status: :created
  end

  private

  def movie_params

    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end

end
