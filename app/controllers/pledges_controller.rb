class PledgesController < ApplicationController
  before_action :require_login

  def create

    @progress_updates = ProgressUpdate.all
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.build
    @pledge.dollar_amount = params[:pledge][:dollar_amount]
    @pledge.user = current_user
    @comments = @project.comments
    @comment = Comment.new
    @categories = Category.all

    if already_pledged?(current_user)
      flash.now[:alert] = "You have already backed this project!"
      render 'projects/show'
    elsif @pledge.save && @pledge.reward_check
      redirect_to project_url(@project), notice: "You have successfully backed #{@project.title} and earned the #{@pledge.reward_check.description} reward!"
    else
      flash.now[:alert] = @pledge.errors.full_messages.first
      render 'projects/show'
    end
  end

  def already_pledged?(user)
    @project.pledges.pluck(:user_id).include?(current_user.id)
  end

end
