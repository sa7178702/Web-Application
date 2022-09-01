class SessionsController < ApplicationController


  def new  
    user = User.new
  end 

  def create  
    user = User.find_by_email(params[:email])   
    if  user.password == params[:password]
      session[:user_id] = user.id   
      redirect_to root_url, success: 'Logged in!'   
    else   
      flash[:success] = "password not match fill currect password"  
    end   
  end  

  def destroy   
    session[:user_id] = nil   
    redirect_to root_url, danger: 'Logged out!'   
  end   

end
