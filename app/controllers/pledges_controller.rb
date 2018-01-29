class PledgesController < ApplicationController
  before_action :require_login

  def create
    @project = Project.find(params[:project_id])

    @pledge = @project.pledges.build
    @pledge.dollar_amount = params[:pledge][:dollar_amount]
    @pledge.user = current_user

    if @pledge.save
      redirect_to project_url(@project), notice: "You have successfully backed #{@project.title}!"
    else
      flash.now[:alert] = @pledge.errors.full_messages.first
      render 'projects/show'
    end
  end

  def require_login
    unless current_user
      flash[:alert] = ["You must be logged in to create or view reservations"]
      redirect_to login_path
    end
  end

end
