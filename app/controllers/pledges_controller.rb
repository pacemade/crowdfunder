class PledgesController < ApplicationController
  before_action :require_login

  def create
    @project = Project.find(params[:project_id])

    @pledge = @project.pledges.build
    @pledge.dollar_amount = params[:pledge][:dollar_amount]
    @pledge.user = current_user

    if already_pledged?(current_user)
      flash.now[:alert] = "You have already backed this project!"
      render 'projects/show'
    elsif @pledge.save
      @pledge.reward_check
      redirect_to project_url(@project), notice: "You have successfully backed #{@project.title} and earned the #{@pledge.reward_check.description} reward!"
    else
      flash.now[:alert] = @pledge.errors.full_messages.first
      render 'projects/show'
    end
  end

  def already_pledged?(user)
    # user_ids.include?(user.id)
    @project.pledges.pluck(:user_id).include?(current_user.id)
  end

end
