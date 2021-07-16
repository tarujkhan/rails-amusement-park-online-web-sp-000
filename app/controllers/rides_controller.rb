class RidesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def create
        # byebug
        @ride = Ride.create(ride_params)
        @ride.take_ride
        redirect_to user_path(@ride.user)
        # @user = User.find(session[:user_id])
    end 
end

private
def ride_params
    params.require(:ride).permit(:user_id, :attraction_id) 
    # if params[:ride]
end 
