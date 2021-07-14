class RidesController < ApplicationController
    def create
        @ride = Ride.new(ride_params)
    end 
end

private
def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
end 
