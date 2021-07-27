class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end
  
  def new
    @attraction = Attraction.new
  end

  def edit
  end 

  def destroy
  end 

  def show
      # @rides = Ride.all
      @attraction = Attraction.find_by(id: params[:id])
      # byebug
      @ride = @attraction.rides.build(user_id: current_user.id)
    if session[:user_id]
      @user = User.find(session[:user_id]) #bringing a user inside the attractions index page
      # redirect_to user_path
    end
  end

  def create
    byebug
    @attraction = Attraction.new(attraction_params)
    
    redirect_to attraction_path(@attraction)
    # check to see if admin. if admin let them add an attraction. 
  end 

  private 
  def attraction_params
  params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end