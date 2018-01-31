class ProgressUpdatesController < ApplicationController

  def create
    @progress_update = ProgressUpdate.new
    @progress_update.content = params[:progress_update][:content]
    @progress_update.project = Project.find(params[:project_id])


    if @progress_update.save
      redirect_to project_url(@progress_update.project)
    else
      flash[:notice] = "There was an error with your form. Please try again."
      render :new

    end
  end

end
