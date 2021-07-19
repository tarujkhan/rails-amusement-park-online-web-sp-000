class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
      if self.user.height > self.attraction.min_height && self.user.tickets > self.attraction.tickets 
      flash[:message] = "Thanks for riding the #{@attraction.name}"
      else 
        self.attraction.min_height > self.user.height
      flash[:message] = "You are not tall enough to tide the #{@attraction.name}"
      elsif 
        self.attraction.tickets > self.user.tickets
        flash[:message] = "You do not have enough tickets to ride #{@attraction.name}"
      elsif 
        self.attraction.min_height > self.user.height && self.attraction.tickets > self.user.tickets 
        flash[:message] = "You are not tall enough to ride the #{@attraction.name}"
        flash[:message] = "You do not have enough tickets to ride the #{@attraction.name}"
        end 
      end
    end
  end
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
    @ride = @attraction.rides.build(user_id: current_user)
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