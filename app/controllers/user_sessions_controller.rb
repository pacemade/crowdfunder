class UserSessionsController < ApplicationController
  def new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to projects_url, notice: "Logged in!"
    else
      flash[:notice] = "There was an error with your form. Please try again."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
