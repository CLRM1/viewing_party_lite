class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.new(params[:id])
    if session[:user_id] == nil
      flash[:error] = "Error: you must be logged in to create a viewing party."
      redirect_to "/users/movies/#{params[:id]}"
    end
  end
end
