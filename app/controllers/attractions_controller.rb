class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @users = User.all
    @rides = Ride.all
    # byebug
  end

  def edit
  end

  def add
  end

  def destroy
  end 

  def show
    # @rides = Ride.all
    @attraction = Attraction.find_by(id: params[:id])
    # byebug
    if session[:user_id]
      @user = User.find(session[:user_id]) #bringing a user inside the attractions index page
      # redirect_to user_path
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