# require 'pry'
class SessionsController < ApplicationController 
  
  def new
    @user = User.new 
    @users = User.all
  end 
  
  def create 
    @users = User.all
    # byebug
    @user = User.find_by(name: params[:user][:name])
    if @user 
      # byebug
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      else 
        render 'new'
      end
    else 
      render 'new'
    end
  end   
end