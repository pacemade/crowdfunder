class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
    @projects = Project.search(params[:term])
  end

  def show
    @project = Project.find(params[:id])
    @progress_update = ProgressUpdate.new
    @progress_updates = @project.progress_updates
    @comment = Comment.new
    @comments = @project.comments
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new
    @project.title = params[:project][:title]
    @project.description = params[:project][:description]
    @project.goal = params[:project][:goal]
    @project.start_date = params[:project][:start_date]
    @project.end_date = params[:project][:end_date]
    @project.image = params[:project][:image]
    @project.user_id = session[:user_id]

    if @project.save
      redirect_to projects_url
    else
      flash[:notice] = "There was an error with your form. Please try again."
      render :new

    end
   end

   def task_params
     params.require[:project].permit(:title, :description, :goal, :user_id, :term)
   end

end
