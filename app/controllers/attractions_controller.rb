class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    # byebug
    if session[:user_id]
      @user = User.find(session[:user_id]) #bringing a user inside the attractions index page
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
  end 

  private 
  def attraction_params
  params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end