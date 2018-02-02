class UsersController < ApplicationController
  def new
    @categories = Category.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @pledges = @user.pledges
    @categories = Category.all

  end

  def create
    @categories = Category.all
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect_to projects_url
    else
      flash[:notice] = "There was an error with your form. Please try again."
      render 'new'
    end
  end



end
