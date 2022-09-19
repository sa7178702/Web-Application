class SessionsController < ApplicationController

  def new  
  end 

  def create  
    byebug
    user = User.find_by_email(params[:email])   
    #if user && user.authenticate(params[:password]) 
    if user.password == params[:password]
      session[:user_id] = user.id   
      redirect_to root_path
      flash[:notice] = "User Login In "  
    else   
    end   
  end  

  def destroy   
    session[:user_id] = nil   
    redirect_to root_path
    flash[:alert] = "Logged out!"  
  end   

end
