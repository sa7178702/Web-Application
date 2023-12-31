class UsersController < ApplicationController
   
   def index
    @user = User.all
    @user = @user.paginate(page: params[:page], per_page: 2)
  end

  def new
    @user = User.new
  end

  def create   
    @user = User.new(user_params)  
    if @user.save   
      session[:user_id] = @user.id   
      redirect_to root_url 
       flash[:notice] = "User successfully created."
    else   
      render :new   
    end 
  end  

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
      redirect_to user_path
      flash[:notice] = "User successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
     if @user.destroy
      redirect_to user_path(@user)
      flash[:notice] = "User successfully destroy."
    end
  end

  def download
     pdf = Prawn::Document.new
     pdf.text("Prawn Rocks")
     send_data(pdf.render,
      filenme: 'hello.pdf',
      type: 'application/pdf')
  end

  def pdf
    @user = User.all
     pdf = Prawn::Document.new
     pdf.text @user.id,

     send_data(pdf.render,
      filenme: "#{@user}.pdf",
      type: 'application/pdf')
  end

  def preview
  end

 private

 def user_params
  params.require(:user).permit(:name, :email, :password, :address, :mobno, :main_image)
 end
end
